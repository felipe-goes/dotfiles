return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
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
        "powershell_es",
        "pyright",
      },
      automatic_installation = true,
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              server_installed = "✓",
              server_pending = "➜",
              server_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
}
