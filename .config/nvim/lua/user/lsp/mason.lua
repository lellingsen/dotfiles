require("mason").setup()
-- non-LSP tools used by none-ls (formatters/linters), guaranteed installed
require("mason-tool-installer").setup({
  ensure_installed = { "mypy", "eslint_d", "debugpy", "js-debug-adapter" },
})
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "jsonls", "rust_analyzer", "ruff" },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
    ["ts_ls"] = function()
      require("lspconfig").ts_ls.setup({
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })
    end,
  },
})
