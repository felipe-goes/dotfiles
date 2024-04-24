local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("Missing nvim-treesitter: treesitter.lua")
  return
end

configs.setup({
  auto_install = true,
  -- ensure_installed = { "arduino", "asm", "awk", "bash", "c", "cpp", "c_sharp",
  --   "cmake", "css", "csv", "dart", "diff", "dockerfile", "gitcommit", "git_config",
  --   "git_rebase", "gitattributes", "gitignore", "go", "graphql", "html", "http",
  --   "java", "javascript", "json", "json5", "kotlin", "lua", "luadoc", "make",
  --   "markdown", "matlab", "perl", "php", "printf", "python", "r", "regex", "ruby",
  --   "rust", "sql", "swift", "typescript", "xml", "yaml"
  --   -- "nginx", "powershell", "ssh",
  -- }, -- one of "all", "maintained" (parsers with maintainers), or list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
    indent = { enable = true},
  },
  indent = { enable = false, disable = { "yaml" } },
})
