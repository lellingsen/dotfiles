setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

setup()

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('config-lsp-attach', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')
        map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gl', vim.diagnostic.open_float, '[L]ine Diagnostics')
        map('<leader>k', vim.lsp.buf.hover, 'Hover Documentation')
        map('<leader>K', vim.lsp.buf.signature_help, 'Signature Documentation')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    end
})
