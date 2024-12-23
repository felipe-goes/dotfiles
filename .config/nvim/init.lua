-- __________      ___________                     ________________
-- ___  ____/_____ ___  /___(_)________ _____      __  ____/____/_/_____ ________
-- __  /_    _  _ \__  / __  / ___  __ \_  _ \     _  / __  _  __ \_  _ \__  ___/
-- _  __/    /  __/_  /  _  /  __  /_/ //  __/     / /_/ /  / /_/ //  __/_(__  )
-- /_/       \___/ /_/   /_/   _  .___/ \___/      \____/   \____/ \___/ /____/
--                             /_/
--
-- Email  : ogoesfelipe@gmail.com
-- Twitter: @felipeogoes
-- Github : https://github.com/felipe-goes
--

-- Great source of plugins for Neovim
-- https://github.com/rockerBOO/awesome-neovim#file-explorer

require("user.plugins")
local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("Missing notify: init.lua")
  return
end
vim.notify = notify

require("user.colorscheme") -- always on top
require("user.indentline") -- always before options
require("user.options")
require("user.autopairs")
require("user.surround")
require("user.devicons")
require("user.colorizer")
require("user.completions")
require("user.ufo")
require("user.lsp")
require("user.dap")
require("user.cmake")
require("user.telescope")
require("user.treesitter")
require("user.context")
require("user.comment")
require("user.gitsigns")
require("user.neogit")
require("user.diffview")
require("user.oil")
require("user.lualine")
require("user.vim-test")
require("user.go")
require("user.todo")
require("user.noice")
require("user.keymaps")
require("user.whichkey")
require("user.autocommands")
