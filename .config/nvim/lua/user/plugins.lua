local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Missing packer: plugins.lua")
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- Run in background
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use({ "dracula/vim", as = "dracula" })
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  use("ryanoasis/vim-devicons")
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("kyazdani42/nvim-web-devicons")
  use("stevearc/dressing.nvim")
  use({
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker")
    end,
  })
  use("akinsho/bufferline.nvim")
  use("moll/vim-bbye")
  use("tamton-aquib/staline.nvim")
  use("lewis6991/impatient.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("goolord/alpha-nvim")
  use("antoinemadec/FixCursorHold.nvim")
  use("folke/which-key.nvim")
  use("jessarcher/vim-heritage")
  use("farmergreg/vim-lastplace")
  use("unblevable/quick-scope")
  use("tpope/vim-repeat")
  use("norcalli/nvim-colorizer.lua")
  use("nelstrom/vim-visual-star-search")
  use("chrisbra/csv.vim")
  use("jghauser/follow-md-links.nvim")
  use("kevinhwang91/nvim-bqf")

  -- Miscellaneous
  use("tommcdo/vim-lion")
  use("kyazdani42/nvim-tree.lua")
  use("akinsho/toggleterm.nvim") -- Consider floaterm latter and bring toggleterm.lua with it
  use("karb94/neoscroll.nvim")
  use("tpope/vim-surround")
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  })
  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- Completion
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completion
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("ray-x/lsp_signature.nvim") -- lsp signature hint as you type
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")

  -- Snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use("neovim/nvim-lspconfig") -- enable LSP
  use("williamboman/nvim-lsp-installer") -- simple to use language server installer
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json
  use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-fzy-native.nvim") -- not sure yet what it does
  use("ahmedkhalf/project.nvim")

  -- Comment
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("numToStr/Comment.nvim") -- Easily comment stuff
  -- Save this for later if the comment plugin is getting a hard time on files with different languages
  -- use("jessarcher/vim-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")

  -- Debugger
  use("mfussenegger/nvim-dap")
  use("nvim-telescope/telescope-dap.nvim")
  use("theHamsta/nvim-dap-virtual-text")
  use("rcarriga/nvim-dap-ui")

  -- Build
  use("Shatur/neovim-cmake")

  -- Honorable Mention
  -- use("tpope/vim-dispatch")
  -- use("tpope/vim-fugitive") | use("tpope/vim-rhubarb")
  -- use("sickill/vim-pasta")
  -- use("airblade/vim-rooter")
  -- use("christoomey/vim-tmux-navigator")
  -- Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
