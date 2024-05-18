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
  use({
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  })
  use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
  use("ryanoasis/vim-devicons")
  use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/nvim-treesitter-context")
  use("nvim-tree/nvim-web-devicons")
  use("stevearc/dressing.nvim")
  use({
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker")
    end,
  })
  use("moll/vim-bbye")
  use("tamton-aquib/staline.nvim")
  use("lukas-reineke/indent-blankline.nvim")
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
  use("ggandor/leap.nvim")
  use({ "ray-x/guihua.lua", run = "cd lua/fzy && make" })
  use("rcarriga/nvim-notify")
  use("folke/noice.nvim")
  use("MunifTanjim/nui.nvim")

  -- Miscellaneous
  use("tommcdo/vim-lion")
  use("nvim-tree/nvim-tree.lua")
  use("karb94/neoscroll.nvim")
  use("tpope/vim-surround")
  -- This fixed toppair/peek.nvim issue: Module not found "file:///home/felipe/.local/share/nvim/site/pack/packer/start/peek.nvim/main.bundle.js"
  --   deno run --allow-run --allow-net --allow-read --allow-write --allow-env --no-check scripts/build.js
  -- Go to the directory ~/.local/share/nvim/site/pack/packer/start/peek.nvim
  -- to run the command above
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
  })
  use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
  use({
    "princejoogie/chafa.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "m00qek/baleia.nvim",
    },
  })

  -- Completion
  use("hrsh7th/nvim-cmp") -- The completion plugin
  use("hrsh7th/cmp-buffer") -- buffer completions
  use("hrsh7th/cmp-path") -- path completions
  use("hrsh7th/cmp-cmdline") -- cmdline completion
  use("saadparwaiz1/cmp_luasnip") -- snippet completions
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("ray-x/go.nvim")

  -- Snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

  -- LSP
  use({
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim", -- simple to use language server installer
    "williamboman/mason-lspconfig.nvim",
  })
  use("tamago324/nlsp-settings.nvim") -- language server settings defined in json
  use("nvimtools/none-ls.nvim") -- for formatters and linters
  use("nvimtools/none-ls-extras.nvim")
  use("gbprod/none-ls-shellcheck.nvim")
  use("folke/trouble.nvim")

  use({
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  -- Telescope
  use("nvim-telescope/telescope.nvim")
  use("nvim-telescope/telescope-fzy-native.nvim") -- not sure yet what it does
  use("nvim-telescope/telescope-media-files.nvim")
  use("nvim-telescope/telescope-ui-select.nvim")

  -- Comment
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("numToStr/Comment.nvim") -- Easily comment stuff
  use("folke/todo-comments.nvim")
  -- Save this for later if the comment plugin is getting a hard time on files with different languages
  -- use("jessarcher/vim-context-commentstring")

  -- Git
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")
  use({
    "NeogitOrg/neogit",
    tag = "v0.0.1",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })

  -- Test
  use({
    "vim-test/vim-test",
    requires = {
      "preservim/vimux",
    },
  })

  -- Dap
  use("mfussenegger/nvim-dap")
  use("rcarriga/nvim-dap-ui")
  use("nvim-neotest/nvim-nio")
  use("theHamsta/nvim-dap-virtual-text")
  use("nvim-telescope/telescope-dap.nvim")
  -- Debuggers
  use("Willem-J-an/nvim-dap-powershell")
  use("leoluz/nvim-dap-go")

  -- Build
  use("Shatur/neovim-cmake")

  -- Tmux
  use("christoomey/vim-tmux-navigator")

  -- Honorable Mention
  -- use("tpope/vim-dispatch")
  -- use("sickill/vim-pasta")
  -- use("airblade/vim-rooter")
  -- Plug 'mg979/vim-visual-multi', {'branch': 'master'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
