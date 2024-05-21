local status_ok, staline = pcall(require, "staline")
if not status_ok then
  vim.notify("Missing staline: staline.lua")
  return
end

staline.setup({
  sections = {
    left = {
      "-mode",
      "left_sep",
      -- { "Evil", " " },
      { "StalineFile", "file_name" },
      { "StalineGit", "branch" },
      " ", -- Filename in different highlight
      "lsp",
    },
    mid = { "lsp_name" }, -- "lsp_name" is still a little buggy
    right = {
      { "StalineEnc", vim.bo.fileencoding:upper() },
      " ",
      -- { "StalineEnc", " |"},
      { "StalineEnc", "cool_symbol" },
      -- { "StalineEnc", "|"},
      { "StalineEnc", "line_column" },
      " ", -- the cool_symbol for your OS
      "▊", -- Branch Name in different highlight
    },
  },
  defaults = {
    bg = "#202328",
    branch_symbol = " ",
    true_colors = true,
    left_separator = "",
    right_separator = "",
    mod_symbol = " 󰧞 ",
    lsp_client_symbol = " ",
    line_column = "%l:%c [%p%%]",
    -- line_column = "%l:%c [%L]",
    -- line_column = "[%l:%c] 並%p%% ",
  },
  mode_colors = {
    n = "#38b1f0",
    i = "#9ece6a",
    v = "#fc802d",
    V = "#fc802d"
  },
  mode_icons = {
    n = "󰋜 ",
    i = "󰏫 ",
    c = " ",
    v = "󰈈 ",
    V = "󰈈 ",
    R = " ",
  },
  special_table = {
    NvimTree = { "NvimTree", " " },
    packer = { "Packer", "󰏖 " }, -- etc
  },
  lsp_symbols = {
    Error = "  ",
    Info = "  ",
    Warn = "  ",
    Hint = "  ",
  },
})

vim.cmd([[hi Evil        guifg=#f36365 guibg=#202328]]) -- Higlight for Evil symbol
vim.cmd([[hi StalineEnc  guifg=#8fbf7f guibg=#202328]]) -- Encoding Highlight
vim.cmd([[hi StalineGit  guifg=#8583b3 guibg=#202328]]) -- Branch Name Highlight
vim.cmd([[hi StalineFile guifg=#c37cda guibg=#202328]]) -- File name Highlight

