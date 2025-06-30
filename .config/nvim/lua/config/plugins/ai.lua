return {
  {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    -- build = function()
    --   -- conditionally use the correct build system for the current OS
    --   if vim.fn.has("win32") == 1 then
    --     return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    --   else
    --     return "make"
    --   end
    -- end,
    build = "make",
    event = "VeryLazy",
    -- false: this will pull always the latest change
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      -- add any opts here
      -- for example
      provider = "openai",
      providers = {
        -- ollama = {
        --   endpoint = "127.0.0.1:11434",
        --   model = "deepseek-coder:6.7b-instruct-q4_K_M",
        -- },
        claude = {
          endpoint = "https://api.anthropic.com",
          model = "claude-sonnet-4-20250514",
          timeout = 30000, -- Timeout in milliseconds
          extra_request_body = {
            temperature = 0.75,
            max_tokens = 20480,
          },
        },
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4o-mini", -- your desired model (or use gpt-4o, etc.)
          timeout = 30000,       -- Timeout in milliseconds, increase this for reasoning models
          extra_request_body = {
            temperature = 0,
            -- max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          },
        },
      },
      -- Example: Using snacks.nvim as input provider
      input = {
        provider = "snacks", -- "native" | "dressing" | "snacks"
        provider_opts = {
          -- Snacks input configuration
          title = "Avante Input",
          icon = "󰌆 ",
          placeholder = "Enter your API key...",
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua",              -- for file_selector provider fzf
      "folke/snacks.nvim",             -- for input provider snacks
      "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
