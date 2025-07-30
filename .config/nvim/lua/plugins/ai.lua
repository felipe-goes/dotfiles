return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      display = {
        chat = {
          window = { position = "right" }, -- left|right|top|bottom
        },
      },
      strategies = {
        chat = {
          adapter = { name = "openai", model = "gpt-4.1-nano" },
        },
        inline = {
          adapter = { name = "openai", model = "gpt-4.1-nano" },
        },
        cmd = {
          adapter = { name = "openai", model = "gpt-4.1-nano" },
        },
      },
      adapters = {
        openai = function() end,
      },
    },
    config = function(_, opts)
      -- Configure openai adapter
      local openai_key = os.getenv("OPENAI_API_KEY")

      opts.adapters.openai = function()
        return require("codecompanion.adapters").extend("openai", {
          schema = { model = { default = "gpt-4.1-nano" } },
          env = { api_key = openai_key },
        })
      end

      -- Call setup function
      require("codecompanion").setup(opts)
    end,
  },
}
