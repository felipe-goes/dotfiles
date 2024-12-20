local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  vim.notify("Missing mason: mason.lua")
  return
end

local masonlsp_status_ok, masonlsp = pcall(require, "mason-lspconfig")
if not masonlsp_status_ok then
  vim.notify("Missing masonlsp: mason.lua")
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

-- acho que só funciona pra lsp
masonlsp.setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "dockerls",
    "docker_compose_language_service",
    "gopls",
    "html",
    "jsonls",
    "lua_ls",
    "markdown_oxide",
    "matlab_ls",
    "powershell_es",
    "pyright",
  },
  automatic_installation = true,
})
