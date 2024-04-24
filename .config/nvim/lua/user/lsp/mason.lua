local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Missing mason: mason.lua")
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

-- commented lsp servers not working
require("mason-lspconfig").setup({
  ensure_installed = {
    "awk_ls",
    "ansiblels",
    "arduino_language_server",
    "asm_lsp",
    "bashls",
    "clangd",
    -- "csharp_ls",
    "omnisharp",
    "cmake",
    "cssls",
    "dockerls",
    "docker_compose_language_service",
    "gopls",
    "jsonls",
    "jdtls",
    "tsserver",
    "kotlin_language_server",
    "lua_ls",
    "autotools_ls",
    "markdown_oxide",
    "matlab_ls",
    "intelephense",
    "powershell_es",
    "pyright",
    "pylsp",
    -- "r_language_server",
    "sqls",
    "lemminx",
    "gitlab_ci_ls"
  }
})
