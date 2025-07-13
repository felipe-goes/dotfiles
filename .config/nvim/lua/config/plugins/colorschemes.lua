return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      saturation = 0.8,
    },
    config = function(_, opts)
      require("cyberdream").setup(opts)
      vim.cmd("colorscheme cyberdream")
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     -- vim.cmd.colorscheme("tokyonight-moon")
  --   end,
  -- },
  -- {
  --   "0xstepit/flow.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     theme = {
  --       transparent = true,
  --     },
  --     colors = {
  --       mode = "dark", -- "default" | "dark" | "light"
  --       fluo = "pink", -- "pink" | "cyan" | "yellow" | "orange" | "green"
  --       custom = {
  --         saturation = "50", -- "" | string representing an integer between 0 and 100
  --         light = "50", -- "" | string representing an integer between 0 and 100
  --       },
  --     },
  --     config = function(_, opts)
  --       require("flow").setup(opts)
  --       -- vim.cmd("colorscheme flow")
  --     end,
  --   },
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   opts = {
  --     transparent = true,
  --   },
  --   config = function(_, opts)
  --     require("kanagawa").setup(opts)
  --     -- vim.cmd("colorscheme kanagawa")
  --   end,
  -- },
  -- {
  --   "rose-pine/neovim",
  --   lazy = false,
  --   priority = 1000,
  --   name = "rose-pine",
  --   opts = {
  --     styles = {
  --       transparency = true,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("rose-pine").setup(opts)
  --     -- vim.cmd("colorscheme rose-pine-main")
  --   end,
  -- },
  -- {
  --   "tiagovla/tokyodark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     gamma = 0.95,
  --     transparent_background = true,
  --   },
  --   config = function(_, opts)
  --     require("tokyodark").setup(opts) -- calling setup is optional
  --     -- vim.cmd.colorscheme("tokyodark")
  --   end,
  -- },
  -- {
  --   "Mofiqul/dracula.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent_bg = true,
  --   },
  --   config = function(_, opts)
  --     require("dracula").setup(opts) -- calling setup is optional
  --     -- vim.cmd.colorscheme("dracula")
  --   end,
  -- },
}
