local status_ok, lspconfig = pcall(require, "lspconfig")

if not status_ok then
  return
end

require("user.lsp.mason")
require("user.lsp.handlers")
require("user.lsp.null-ls")
