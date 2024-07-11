local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Run in background
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  "Civitasv/cmake-tools.nvim",
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "ryanoasis/vim-devicons",
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-tree/nvim-web-devicons",
  "stevearc/dressing.nvim",
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })
    end,
  },
  "moll/vim-bbye",
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  "farmergreg/vim-lastplace",
  "norcalli/nvim-colorizer.lua",
  "nelstrom/vim-visual-star-search",
  -- TODO: Check for better solutions for csv files
  "chrisbra/csv.vim",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<cr>",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  "ray-x/guihua.lua",
  "rcarriga/nvim-notify",
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Miscellaneous
  "tommcdo/vim-lion",
  "nvim-tree/nvim-tree.lua",
  -- "tpope/vim-repeat",
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  { "echasnovski/mini.nvim", version = false },
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

  -- Completion
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completion
  "saadparwaiz1/cmp_luasnip", -- snippet completions
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = "rafamadriz/friendly-snippets", -- a bunch of snippets to use
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim", -- simple to use language server installer
    "williamboman/mason-lspconfig.nvim",
  },
  "tamago324/nlsp-settings.nvim", -- language server settings defined in json
  "nvimtools/none-ls.nvim", -- for formatters and linters
  "nvimtools/none-ls-extras.nvim",
  "gbprod/none-ls-shellcheck.nvim",
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim", -- not sure yet what it does
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-ui-select.nvim",

  -- Comment
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
  }, -- Easily comment stuff
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Git
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  -- Test
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
  },

  -- Dap
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "nvim-neotest/nvim-nio",
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",
  -- Debuggers
  "leoluz/nvim-dap-go",

  -- Tmux
  "christoomey/vim-tmux-navigator",
}

local opts = {}
require("lazy").setup(plugins, opts)
