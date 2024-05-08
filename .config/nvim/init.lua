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

-- Inspired by https://github.com/LunarVim/Neovim-from-scratch/tree/master
-- Inspired by https://github.com/jessarcher/dotfiles

vim.loader.enable()

require("user.colorscheme") -- always on top
require("user.indentline") -- always before options
require("user.devicons")
require("user.options")
require("user.plugins")
require("user.colorizer")
require("user.completions")
require("user.signature")
require("user.ufo")
require("user.lsp")
require("user.dap")
require("user.cmake")
require("user.telescope")
require("user.harpoon")
require("user.chafa")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.diffview")
require("user.nvimtree")
require("user.bufferline")
require("user.staline")
require("user.tmux")
require("user.vim-test")
require("user.quickscope")
require("user.neoscroll")
require("user.markdown")
require("user.keymaps")
require("user.whichkey")
require("user.autocommands")
