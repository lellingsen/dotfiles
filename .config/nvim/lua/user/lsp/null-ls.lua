local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local root_pattern = require("lspconfig.util").root_pattern

-- walk up from the file being linted (not nvim's launch dir) to find the
-- project root, so multiple Python projects open under one nvim session
-- each resolve their own venv/config
local python_root = root_pattern(".venv", "mypy.ini", "pyproject.toml", "setup.cfg", ".git")

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
    -- Python formatting handled by ruff LSP
    diagnostics.mypy.with({
      prefer_local = ".venv/bin",
      cwd = function(params)
        return python_root(params.bufname) or vim.fn.getcwd()
      end,
    }),
    require("none-ls.diagnostics.eslint_d").with({
      prefer_local = "node_modules/.bin",
    }),
  },
})
