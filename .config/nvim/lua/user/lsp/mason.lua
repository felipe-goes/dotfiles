local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Missing lsp-installer: lsp-installer.lua")
  return
end

mason.setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})
