return {
  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
      icons = {
        ---@type trouble.Indent.symbols
        indent = {
          last = "╰╴", -- rounded
        },
      },
      cmd = "Trouble",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local sorters = require("telescope.sorters")
      local previewers = require("telescope.previewers")
      local themes = require("telescope.themes")
      local open_with_trouble = require("trouble.sources.telescope").open
      -- Use this to add more results without clearing the trouble list
      local add_to_trouble = require("trouble.sources.telescope").add

      telescope.setup({
        defaults = {
          file_sorter = sorters.get_fzy_sorter,

          prompt_prefix = " 󰁔 ",
          selection_caret = " ",
          path_display = { "table" },
          color_devicons = true,

          file_ignore_patterns = {},

          file_previewer = previewers.vim_buffer_cat.new,
          grep_previewer = previewers.vim_buffer_vimgrep.new,
          qflist_previewer = previewers.vim_buffer_qflist.new,
          buffer_previewer_maker = previewers.buffer_previewer_maker,

          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,

              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,

              ["<C-c>"] = actions.close,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = add_to_trouble,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<C-q>"] = open_with_trouble,
              ["<M-q>"] = open_with_trouble,
              ["<C-l>"] = actions.complete_tag,
              ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
              ["<esc>"] = actions.close,
              ["<CR>"] = actions.select_default,
              ["<C-x>"] = actions.select_horizontal,
              ["<C-v>"] = actions.select_vertical,
              ["<C-t>"] = actions.select_tab,

              ["<Tab>"] = actions.toggle_selection + actions.move_selection_better,
              ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_worse,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

              ["j"] = actions.move_selection_next,
              ["k"] = actions.move_selection_previous,
              ["H"] = actions.move_to_top,
              ["M"] = actions.move_to_middle,
              ["L"] = actions.move_to_bottom,
              ["t"] = add_to_trouble,
              ["T"] = open_with_trouble,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,
              ["gg"] = actions.move_to_top,
              ["G"] = actions.move_to_bottom,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp>"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,

              ["?"] = actions.which_key,
            },
          },
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg" },
            find_cmd = "rg", -- find command (defaults to `fd`)
          },
          fzf = {},
          ["ui-select"] = {
            themes.get_dropdown({
              -- even more opts
            }),

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
          -- Your extension configuration goes here:
          -- extension_name = {
          --   extension_config_key = value,
          -- }
          -- please take a look at the readme of the extension you want to configure
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("dap")
      telescope.load_extension("media_files")
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      telescope.load_extension("ui-select")
      require("config.multigrep").setup()

    end
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  "nvim-telescope/telescope-media-files.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  {
    "andrew-george/telescope-themes",
    config = function()
      require("telescope").load_extension("themes")
    end,
  },
}
