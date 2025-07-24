return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          bash = { "shfmt" },
          cpp = { "clang_format" },
          cmake = { "cmake_format" },
          go = { "goimports", "gci" },
          html = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          lua = { "stylua" },
          markdown = { "mdformat" },
          python = { "isort", "black" },
          yaml = { "prettierd", "prettier", stop_after_first = true },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typesript = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "prettierd", "prettier", stop_after_first = true },
          typesriptreact = { "prettierd", "prettier", stop_after_first = true },
        },
        formatters = {
          prettier = {
            append_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
          },
          stylua = {
            append_args = { "--indent-type", "Spaces", "--indent-width", "2" },
          },
          black = {
            append_args = { "--fast" },
          },
        },
      })
    end,
  },
}
