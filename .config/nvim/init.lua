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

require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.nvim-tree") -- kind of slow. try nerdtree later
require("user.bufferline")
