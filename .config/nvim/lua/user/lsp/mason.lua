require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "tsserver", "jsonls", "rust_analyzer", "pyright", "kotlin-language-server" }
})
