return {
  {
    "mfussenegger/nvim-lint",
    event = {
      "LspAttach",
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        bash = { "shellcheck" },
        cpp = { "cpplint" },
        cmake = { "cmakelint" },
        go = { "golangcilint" },
        html = { "markuplint" },
        json = { "jsonlint" },
        lua = { "luacheck" },
        markdown = { "markdownlint-cli2" },
        python = { "ruff" },
        yaml = { "yamllint" },
        javascript = { "eslint_d" },
        typesript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typesriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
      }

      -- lint.linters.cpplint = require("lint.util").wrap(lint.linters.cpplint, function(diagnostic)
      --   diagnostic.severity = vim.diagnostic.severity.HINT
      --   return diagnostic
      -- end)

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "LspAttach", "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end
  }
}
