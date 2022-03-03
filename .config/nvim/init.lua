require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.airline"
require "user.autocommands"

-- Apply Dracula Theme
vim.cmd [[
  packadd! dracula
  syntax enable
  colorscheme dracula
]]
