local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    file_sorter    = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = "  ",
    color_devicons = true,

    file_ignore_patterns = {},
    path_display = {"table"},

    file_previewer         = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer         = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer       = require('telescope.previewers').vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      }
    }
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    },
    fzy_native = {
      override_generic_sorter = false,
      override_files_sorter   = true,
    }
  },
}

require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('coc')
require('telescope').load_extension('file_browser')
require('telescope').load_extension('media_files')

