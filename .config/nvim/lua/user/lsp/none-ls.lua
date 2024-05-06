-- none-ls is a fork of null-ls that did not change the variables names
-- therefore, in this file we will still be calling null-ls instead of none-ls
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.notify("Missing none-ls: none-ls.lua")
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
-- local completion = null_ls.builtins.completion
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
-- local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
-- local hover = null_ls.builtins.hover

null_ls.setup({
  sources = {
    -- Formatting
    -- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown,
    -- scss, typescript, vue, yaml
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    -- bash
    formatting.shfmt,
    -- c, c++
    formatting.clang_format,
    -- lua
    formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
    -- python
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.isort,

    -- Linting
    -- bash
    require("none-ls-shellcheck.diagnostics"),
    -- cpp
    require("none-ls.diagnostics.cpplint"),
    -- go
    diagnostics.staticcheck,
    -- html
    diagnostics.markuplint,
    -- lua
    diagnostics.selene,
    -- python
    require("none-ls.diagnostics.flake8"),
    -- typescript, javascript
    require("none-ls.diagnostics.eslint_d"),
    -- yaml
    diagnostics.yamllint,
  },
})
