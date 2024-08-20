require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "jsonls", "rust_analyzer", "jedi_language_server" }
})
