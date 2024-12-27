return {
  "nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
  "christoomey/vim-tmux-navigator",
  "tommcdo/vim-lion",
  "chrisbra/csv.vim",
  {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = function()
      require("glow").setup({
        border = "rounded", -- floating window border config
        style = "dark", -- filled automatically with your current editor background, you can override using glow json style
      })
    end,
  },
  {
    "ziontee113/icon-picker.nvim",
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      -- Toggle file detail view
      local detail = false

      -- Show CWD in the winbar
      -- Declare a global function to retrieve the current directory
      function _G.get_oil_winbar()
        local dir = require("oil").get_current_dir()
        if dir then
          return vim.fn.fnamemodify(dir, ":~")
        else
          -- If there is no current directory (e.g. over ssh), just show the buffer name
          return vim.api.nvim_buf_get_name(0)
        end
      end

      -- Hide gitignored files and show git tracked hidden files
      -- helper function to parse output
      local function parse_output(proc)
        local result = proc:wait()
        local ret = {}
        if result.code == 0 then
          for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
            -- Remove trailing slash
            line = line:gsub("/$", "")
            ret[line] = true
          end
        end
        return ret
      end

      -- build git status cache
      local function new_git_status()
        return setmetatable({}, {
          __index = function(self, key)
            local ignore_proc = vim.system(
              { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
              {
                cwd = key,
                text = true,
              }
            )
            local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
              cwd = key,
              text = true,
            })
            local ret = {
              ignored = parse_output(ignore_proc),
              tracked = parse_output(tracked_proc),
            }

            rawset(self, key, ret)
            return ret
          end,
        })
      end
      local git_status = new_git_status()

      -- Clear git status cache on refresh
      local refresh = require("oil.actions").refresh
      local orig_refresh = refresh.callback
      refresh.callback = function(...)
        git_status = new_git_status()
        orig_refresh(...)
      end

      require("oil").setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          winbar = "%!v:lua.get_oil_winbar()",
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = false,
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = false,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,
        -- Oil will automatically delete hidden buffers after this delay
        -- You can set the delay to false to disable cleanup entirely
        -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
        cleanup_delay_ms = 2000,
        lsp_file_methods = {
          -- Enable or disable LSP file operations
          enabled = true,
          -- Time to wait for LSP file operations to complete before skipping
          timeout_ms = 1000,
          -- Set to true to autosave buffers that are updated with LSP willRenameFiles
          -- Set to "unmodified" to only save unmodified buffers
          autosave_changes = false,
        },
        -- Constrain the cursor to the editable parts of the oil buffer
        -- Set to `false` to disable, or "name" to keep it on the file names
        constrain_cursor = "editable",
        -- Set to true to watch the filesystem for changes and reload oil
        watch_for_changes = false,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
              detail = not detail
              if detail then
                require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
              else
                require("oil").set_columns({ "icon" })
              end
            end,
          },
          ["g?"] = { "actions.show_help", mode = "n" },
          ["<CR>"] = "actions.select",
          ["<C-s>"] = { "actions.select", opts = { vertical = true } },
          ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
          ["<C-t>"] = { "actions.select", opts = { tab = true } },
          ["<C-p>"] = "actions.preview",
          ["q"] = { "actions.close", mode = "n" },
          ["<C-c>"] = { "actions.close", mode = "n" },
          ["<C-l>"] = "actions.refresh",
          ["-"] = { "actions.parent", mode = "n" },
          ["_"] = { "actions.open_cwd", mode = "n" },
          ["`"] = { "actions.cd", mode = "n" },
          ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
          ["gs"] = { "actions.change_sort", mode = "n" },
          ["gx"] = "actions.open_external",
          ["g."] = { "actions.toggle_hidden", mode = "n" },
          ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            -- local m = name:match("^%.")
            -- return m ~= nil
            local dir = require("oil").get_current_dir(bufnr)
            local is_dotfile = vim.startswith(name, ".") and name ~= ".."
            -- if no local directory (e.g. for ssh connections), just hide dotfiles
            if not dir then
              return is_dotfile
            end
            -- dotfiles are considered hidden unless tracked
            if is_dotfile then
              return not git_status[dir].tracked[name]
            else
              -- Check if file is gitignored
              return git_status[dir].ignored[name]
            end
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          -- Sort file names with numbers in a more intuitive order for humans.
          -- Can be "fast", true, or false. "fast" will turn it off for large directories.
          natural_order = "fast",
          -- Sort file and directory names case insensitive
          case_insensitive = false,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
          },
          -- Customize the highlight group for the file name
          highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
            return nil
          end,
        },
        -- Extra arguments to pass to SCP when moving/copying files over SSH
        extra_scp_args = {},
        -- EXPERIMENTAL support for performing file operations with git
        git = {
          -- Return true to automatically git add/mv/rm files
          add = function(path)
            return false
          end,
          mv = function(src_path, dest_path)
            return false
          end,
          rm = function(path)
            return false
          end,
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
          get_win_title = nil,
          -- preview_split: Split direction: "auto", "left", "right", "above", "below".
          preview_split = "auto",
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        -- Configuration for the file preview window
        preview_win = {
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
          -- How to open the preview window "load"|"scratch"|"fast_scratch"
          preview_method = "fast_scratch",
          -- A function that returns true to disable preview on a file e.g. to avoid lag
          disable_preview = function(filename)
            return false
          end,
          -- Window-local options to use for preview window buffers
          win_options = {},
        },
        -- Configuration for the floating action confirmation window
        confirmation = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
          max_height = 0.9,
          -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
        -- Configuration for the floating SSH window
        ssh = {
          border = "rounded",
        },
        -- Configuration for the floating keymaps help window
        keymaps_help = {
          border = "rounded",
        },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "lsp_document_symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        -- The following line is needed to fix the background color
        -- Set it to lualine section you want to use
        hl_group = "lualine_c_normal",
      })

      lualine.setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              "filename",
              file_status = true, -- Displays file status (readonly status, modified status)
              newfile_status = false, -- Display new file status (new file means no write after created)
              path = 1, -- 0: Just the filename
              -- 1: Relative path
              -- 2: Absolute path
              -- 3: Absolute path, with tilde as the home directory
              -- 4: Filename and parent dir, with tilde as the home directory

              shorting_target = 40, -- Shortens path to leave 40 spaces in the window
              -- for other components. (terrible name, any suggestions?)
              symbols = {
                modified = "󰧟", -- Text to show when the file is modified.
                readonly = "󰌾", -- Text to show when the file is non-modifiable or readonly.
                unnamed = "[No Name]", -- Text to show for unnamed buffers.
                newfile = "[New]", -- Text to show for newly created file before first write
              },
            },
            {
              "searchcount",
              maxcount = 999,
              timeout = 500,
            },
            {
              symbols.get,
              cond = symbols.has,
            },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      -- Option 3: treesitter as a main provider instead
      -- (Note: the `nvim-treesitter` plugin is *not* needed.)
      -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
      -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
      require("ufo").setup({
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        cmdline = {
          enabled = true, -- enables the Noice cmdline UI
          view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
          opts = {}, -- global options for the cmdline. See section on views
          ---@type table<string, CmdlineFormat>
          format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
            -- view: (default is cmdline view)
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            -- title: set to anything or empty string to hide
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋗" },
            input = {}, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
          },
        },
        messages = {
          -- NOTE: If you enable messages, then the cmdline is enabled automatically.
          -- This is a current Neovim limitation.
          enabled = true, -- enables the Noice messages UI
          view = "notify", -- default view for messages
          view_error = "notify", -- view for errors
          view_warn = "notify", -- view for warnings
          view_history = "messages", -- view for :messages
          view_search = false, -- view for search count messages. Set to `false` to disable
        },
        popupmenu = {
          enabled = true, -- enables the Noice popupmenu UI
          ---@type 'nui'|'cmp'
          backend = "nui", -- backend to use to show regular cmdline completions
          ---@type NoicePopupmenuItemKind|false
          -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
          kind_icons = {}, -- set to `false` to disable icons
        },
        -- default options for require('noice').redirect
        -- see the section on Command Redirection
        ---@type NoiceRouteConfig
        redirect = {
          view = "popup",
          filter = { event = "msg_show" },
        },
        -- You can add any custom commands below that will be available with `:Noice command`
        ---@type table<string, NoiceCommand>
        commands = {
          history = {
            -- options for the message history that you get with `:Noice`
            view = "split",
            opts = { enter = true, format = "details" },
            filter = {
              any = {
                { event = "notify" },
                { error = true },
                { warning = true },
                { event = "msg_show", kind = { "" } },
                { event = "lsp", kind = "message" },
              },
            },
          },
          -- :Noice last
          last = {
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = {
              any = {
                { event = "notify" },
                { error = true },
                { warning = true },
                { event = "msg_show", kind = { "" } },
                { event = "lsp", kind = "message" },
              },
            },
            filter_opts = { count = 1 },
          },
          -- :Noice errors
          errors = {
            -- options for the message history that you get with `:Noice`
            view = "popup",
            opts = { enter = true, format = "details" },
            filter = { error = true },
            filter_opts = { reverse = true },
          },
          all = {
            -- options for the message history that you get with `:Noice`
            view = "split",
            opts = { enter = true, format = "details" },
            filter = {},
          },
        },
        notify = {
          -- Noice can be used as `vim.notify` so you can route any notification like other messages
          -- Notification messages have their level and other properties set.
          -- event is always "notify" and kind can be any log level as a string
          -- The default routes will forward notifications to nvim-notify
          -- Benefit of using Noice for this is the routing and consistent history view
          enabled = true,
          view = "notify",
        },
        lsp = {
          progress = {
            enabled = true,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            --- @type NoiceFormat|string
            format = "lsp_progress",
            --- @type NoiceFormat|string
            format_done = "lsp_progress_done",
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = "mini",
          },
          override = {
            -- override the default lsp markdown formatter with Noice
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            -- override the lsp markdown formatter with Noice
            ["vim.lsp.util.stylize_markdown"] = true,
            -- override cmp documentation with Noice (needs the other options to work)
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = true,
            silent = false, -- set to true to not show a message if hover is not available
            view = nil, -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {}, -- merged with defaults from documentation
          },
          signature = {
            enabled = true,
            auto_open = {
              enabled = true,
              trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
              luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
              throttle = 50, -- Debounce lsp signature help request by 50ms
            },
            view = nil, -- when nil, use defaults from documentation
            ---@type NoiceViewOptions
            opts = {}, -- merged with defaults from documentation
          },
          message = {
            -- Messages shown by lsp servers
            enabled = true,
            view = "notify",
            opts = {},
          },
          -- defaults for hover and signature help
          documentation = {
            view = "hover",
            ---@type NoiceViewOptions
            opts = {
              lang = "markdown",
              replace = true,
              render = "plain",
              format = { "{message}" },
              win_options = { concealcursor = "n", conceallevel = 3 },
            },
          },
        },
        markdown = {
          hover = {
            ["|(%S-)|"] = vim.cmd.help, -- vim help links
            ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
          },
          highlights = {
            ["|%S-|"] = "@text.reference",
            ["@%S+"] = "@parameter",
            ["^%s*(Parameters:)"] = "@text.title",
            ["^%s*(Return:)"] = "@text.title",
            ["^%s*(See also:)"] = "@text.title",
            ["{%S-}"] = "@parameter",
          },
        },
        health = {
          checker = true, -- Disable if you don't want health checks to run
        },
        smart_move = {
          -- noice tries to move out of the way of existing floating windows.
          enabled = true, -- you can disable this behaviour here
          -- add any filetypes here, that shouldn't trigger smart move.
          excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
        },
        throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
        ---@type NoiceConfigViews
        views = {
          cmdline_popup = {
            position = {
              row = 20,
              col = "50%",
            },
            size = {
              width = 60,
              height = "auto",
            },
          },
          popupmenu = {
            relative = "editor",
            position = {
              row = 8,
              col = "50%",
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
        },
        ---@type NoiceRouteConfig[]
        routes = {
          {
            filter = {
              event = "msg_showmode",
              find = "INSERT",
            },
            opts = { skip = true },
          },
          {
            filter = {
              event = "msg_showmode",
              find = "VISUAL",
            },
            opts = { skip = true },
          },
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
        },
        ---@type table<string, NoiceFilter>
        status = {}, --- @see section on statusline components
        ---@type NoiceFormatOptions
        format = {}, --- @see section on formatting
      })
    end,
  },
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
}
