require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "jsonls", "rust_analyzer", "jedi_language_server" }
})
