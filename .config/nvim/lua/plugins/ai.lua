return {
  {
    "yetone/avante.nvim",
    build = "make",
    event = "VeryLazy",
    -- false: this will pull always the latest change
    version = false, -- Never set this value to "*"! Never!
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      provider = "openai",
      providers = {
        -- ollama = {
        --   endpoint = "127.0.0.1:11434",
        --   model = "deepseek-coder:6.7b-instruct-q4_K_M",
        -- },
        openai = {
          endpoint = "https://api.openai.com/v1",
          model = "gpt-4.1-nano", -- Cheaper to better -> (gpt-4o-mini, gpt-4.1-mini, gpt-4.1)
          timeout = 30000,        -- Timeout in milliseconds, increase this for reasoning models
          -- rag_search, python, git_diff, git_commit, glob, search_keyword,
          -- read_file_toplevel_symbols, read_file, create_file, move_path,
          -- copy_path, delete_path, create_dir, bash, web_search, fetch
          -- disable_tools = { "replace_in_file" },
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
      -- "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
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
