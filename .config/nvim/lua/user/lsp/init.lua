local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Missing lspconfig: lsp/init.lua")
  return
end

require("user.lsp.mason")
require("user.lsp.handlers")
require("user.lsp.null-ls")
