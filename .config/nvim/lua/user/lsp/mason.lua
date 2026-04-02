require("mason").setup()
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
