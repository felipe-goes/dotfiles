return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dapwidgets = require("dap.ui.widgets")

    local which_key = require("which-key")
    local opts = {
      mode = "n", -- NORMAL mode
      win = {
        no_overlap = false, -- don't allow the popup to overlap with the cursor
      },
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    which_key.setup(opts)
    which_key.add({

      -- Hidden
      { "<leader>q", hidden = true },
      { "<leader>Q", hidden = true },
      { "<leader>w", hidden = true },
      { "<leader>W", hidden = true },
      { "<leader>o", hidden = true },
      { "<leader>O", hidden = true },
      { "<leader>h", hidden = true },
      { "<leader>r", hidden = true },
      { "<leader>x", hidden = true },

      -- Do not have a group
      {
        "<leader>e",
        "<cmd>Oil --float<cr>",
        desc = "Explorer",
        icon = {
          icon = "󰉋",
          color = "blue",
        },
      },

      -- Avante
      {
        "<leader>a",
        group = "Avante",
        icon = { icon = "󰧑", color = "blue" },
      },

      -- Find
      { "<leader>f", group = "Find" },
      { "<leader>ff", "<cmd>lua Snacks.picker.files()<cr>", desc = "Files" },
      {
        "<leader>fr",
        "<cmd>lua Snacks.picker.recent()<cr>",
        desc = "Recent Files",
      },
      { "<leader>fp", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Grep" },
      {
        "<leader>fu",
        function()
          Snacks.picker.buffers({
            win = {
              input = {
                keys = {
                  ["d"] = "bufdelete",
                },
              },
              list = { keys = { ["d"] = "bufdelete" } },
            },
          })
        end,
        desc = "Buffers",
      },
      {
        "<leader>fd",
        "<cmd>lua Snacks.picker.diagnostics()<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>ft",
        "<cmd>lua Snacks.picker.todo_comments()<cr>",
        desc = "Todo",
      },

      -- Git
      { "<leader>g", group = "Git" },
      { "<leader>gi", "<cmd>Neogit<cr>", desc = "Neogit Interface" },
      {
        "<leader>gl",
        function()
          Snacks.picker.git_log({
            finder = "git_log",
            format = "git_log",
            preview = "git_show",
            confirm = "git_checkout",
            layout = "vertical",
          })
        end,
        desc = "Git Log",
      },
      {
        "<leader>gc",
        "<cmd>lua Snacks.picker.git_branches()<cr>",
        desc = "Checkout",
      },
      { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff Line" },
      {
        "<leader>gD",
        "<cmd>lua Snacks.picker.git_diff()<cr>",
        desc = "Diff Project",
      },
      { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Next Hunk = ]g" },
      { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", desc = "Prev Hunk = [g" },
      { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame" },
      { "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk" },
      { "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset Hunk" },
      {
        "<leader>gr",
        "<cmd>'<,'>Gitsigns reset_hunk<cr>",
        desc = "Reset Hunk",
        mode = "v",
      },
      { "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset Buffer" },
      {
        "<leader>gs",
        "<cmd>lua Snacks.picker.git_status()<cr>",
        desc = "Status",
      },
      { "<leader>gS", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
      {
        "<leader>gs",
        "<cmd>'<,'>Gitsigns stage_hunk<cr>",
        desc = "Stage Hunk",
        mode = "v",
      },
      {
        "<leader>gu",
        "<cmd>Gitsigns undo_stage_hunk<cr>",
        desc = "Undo Stage Hunk",
      },
      {
        "<leader>gs",
        "<cmd>'<,'>Gitsigns undo_stage_hunk<cr>",
        desc = "Undo Stage Hunk",
        mode = "v",
      },

      -- LSP
      { "<leader>l", group = "LSP", icon = { icon = "", color = "green" } },
      {
        "<leader>la",
        "<cmd>lua vim.lsp.buf.code_action()<cr>",
        desc = "Code Action",
      },
      {
        "<leader>lA",
        "<cmd>lua vim.lsp.codelens.run()<cr>",
        desc = "CodeLens Action",
      },
      {
        "<leader>lf",
        function()
          local conform = require("conform")
          conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
          })
        end,
        desc = "Format",
        mode = { "n", "v" },
      },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      {
        "<leader>lt",
        "<cmd>Trouble lsp_type_definitions<cr>",
        desc = "Type Definition",
      },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      { "<leader>lI", "<cmd>Mason<cr>", desc = "Install" },
      {
        "<leader>ls",
        "<cmd>lua Snacks.picker.lsp_symbols()<cr>",
        desc = "Symbols",
      },
      {
        "<leader>lS",
        "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>",
        desc = "Workspace Symbols",
      },
      {
        "<leader>ld",
        "<cmd>lua Snacks.picker.diagnostics_buffer()<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>lD",
        "<cmd>lua vim.diagnostic.open_float()<cr>",
        desc = "Hover",
      },

      -- LSP Workspace
      { "<leader>lw", group = "LSP Workspace" },
      {
        "<leader>lwa",
        "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
        desc = "Add Workspace Folder",
      },
      {
        "<leader>lwd",
        "<cmd>lua Snacks.picker.diagnostics()<cr>",
        desc = "Workspace Diagnostics",
      },
      {
        "<leader>lwr",
        "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
        desc = "Remove Workspace Folder",
      },
      {
        "<leader>lwl",
        "<cmd>lua vim.lsp.buf.list_workspace_folders()<cr>",
        desc = "List Workspace Folders",
      },

      -- Icon Picker
      {
        "<leader>i",
        group = "Icon Picker",
        icon = { icon = "", color = "yellow" },
      },
      { "<leader>ia", "<cmd>IconPickerNormal<cr>", desc = "Pick Icons" },
      {
        "<leader>in",
        "<cmd>IconPickerNormal nerd_font nerd_font_v3<cr>",
        desc = "Pick Nerd Font",
      },
      { "<leader>ie", "<cmd>IconPickerNormal emoji<cr>", desc = "Pick Emoji" },
      {
        "<leader>is",
        "<cmd>IconPickerNormal symbols<cr>",
        desc = "Pick Symbol",
      },
      {
        "<leader>if",
        "<cmd>IconPickerNormal alt_font<cr>",
        desc = "Pick Alt Font",
      },
      {
        "<leader>ih",
        "<cmd>IconPickerNormal html_colors<cr>",
        desc = "Pick HTML Colors",
      },

      -- Snacks Picker
      {
        "<leader>p",
        group = "Snacks Picker",
        icon = { icon = "󰢷", color = "orange" },
      },
      { "<leader>pp", "<cmd>lua Snacks.picker()<cr>", desc = "Pickers List" },
      {
        "<leader>pc",
        "<cmd>lua Snacks.picker.commands()<cr>",
        desc = "Commands",
      },
      { "<leader>ph", "<cmd>lua Snacks.picker.help()<cr>", desc = "Help" },
      {
        "<leader>pr",
        "<cmd>lua Snacks.picker.registers()<cr>",
        desc = "Registers",
      },
      {
        "<leader>pk",
        function()
          Snacks.picker.keymaps({
            layout = "vertical",
          })
        end,
        desc = "Keymaps",
      },
      {
        "<leader>pn",
        "<cmd>lua Snacks.picker.notifications()<cr>",
        desc = "Notifications",
      },

      -- SGDK
      {
        "<leader>S",
        group = "SGDK",
        icon = { icon = "󰊖", color = "purple" },
      },
      { "<leader>Sb", "<cmd>!sgdk build<cr>", desc = "Build SGDK Project" },
      {
        "<leader>Se",
        "<cmd>!sgdk blastem<cr>",
        desc = "Build and Run Blastem",
      },
      {
        "<leader>Sh",
        "<cmd>!sgdk bizhawk<cr>",
        desc = "Build and Run Bizhawk",
      },
      { "<leader>Sc", "<cmd>!sgdk clean<cr>", desc = "Clean SGDK Project" },
      {
        "<leader>SC",
        "<cmd>!sgdk cmake<cr>",
        desc = "Generate compile_commands.json",
      },

      -- C/C++
      {
        "<leader>c",
        group = "C/C++",
        icon = { icon = "󰙲", color = "blue" },
      },
      {
        "<leader>cc",
        function()
          -- CMake Config
          local release_fidget = {
            title = "CMake Release",
            message = "Running CMake...",
            percentage = nil,
            lsp_client = { name = "CMake Release" },
          }
          local release_command = {
            "cmake",
            "-DCMAKE_BUILD_TYPE=Release",
            "-S",
            ".",
            "-B",
            "./build/release",
          }

          local debug_fidget = {
            title = "CMake Debug",
            message = "Running CMake...",
            percentage = nil,
            lsp_client = { name = "CMake Debug" },
          }
          local debug_command = {
            "cmake",
            "-DCMAKE_BUILD_TYPE=Debug",
            "-S",
            ".",
            "-B",
            "./build/debug",
          }

          CMakeConfig(release_fidget, release_command, "./build/release")
          CMakeConfig(debug_fidget, debug_command, "./build/debug")
        end,
        desc = "CMake Config",
      },
      {
        "<leader>cr",
        function()
          local build_fidget = {
            title = "Build Release",
            message = "Running Build...",
            percentage = nil,
            lsp_client = { name = "Build" },
          }
          local build_path = "./build/release"

          CMakeBuild(build_fidget, build_path)
        end,
        desc = "Build Release",
      },
      {
        "<leader>cd",
        function()
          local build_fidget = {
            title = "Build Debug",
            message = "Running Build...",
            percentage = nil,
            lsp_client = { name = "Build" },
          }
          local build_path = "./build/debug"

          CMakeBuild(build_fidget, build_path)
        end,
        desc = "Build Debug",
      },
      {
        "<leader>cm",
        function()
          local build_path = "./build/release"
          CMakeBuildMake(build_path)
        end,
        desc = "Build with qflist",
      },
      {
        "<leader>cC",
        function()
          local release_fidget = {
            title = "Clean Release",
            message = "Cleaning...",
            percentage = nil,
            lsp_client = { name = "Clean" },
          }
          local debug_fidget = {
            title = "Clean Debug",
            message = "Cleaning...",
            percentage = nil,
            lsp_client = { name = "Clean" },
          }
          local release_path = "./build/release"
          local debug_path = "./build/debug"

          CMakeClean(release_fidget, release_path)
          CMakeClean(debug_fidget, debug_path)
        end,
        desc = "Clean",
      },

      -- Trouble
      {
        "<leader>t",
        group = "Trouble",
        icon = { icon = "󱖫", color = "yellow" },
      },
      {
        "<leader>td",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "LSP Diagnostics",
      },
      { "<leader>tq", "<cmd>Trouble qflist<cr>", desc = "Quickfix List" },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=true<cr>",
        desc = "LSP Symbols",
      },
      {
        "<leader>tt",
        "<cmd>Trouble lsp_type_definitions toggle<cr>",
        desc = "LSP Type Definitions",
      },
      { "<leader>tT", "<cmd>Trouble todo toggle<cr>", desc = "Todo" },

      -- Debugger
      -- See more in keymaps.lua
      { "<leader>d", group = "Debugger" },
      { "<leader>dp", "<cmd>DapContinue<cr>", desc = "Play" },
      {
        "<leader>da",
        function()
          dap.clear_breakpoints()
        end,
        desc = "Clear Breakpoints",
      },
      {
        "<leader>dn",
        function()
          dap.run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      { "<leader>di", "<cmd>DapStepInto<cr>", desc = "Step Into" },
      { "<leader>do", "<cmd>DapStepOver<cr>", desc = "Step Over" },
      { "<leader>dO", "<cmd>DapStepOut<cr>", desc = "Step Out" },
      {
        "<leader>de",
        function()
          dap.set_exception_breakpoints()
        end,
        desc = "Set Exception Breakpoints",
      },
      {
        "<leader>du",
        function()
          dapwidgets.hover()
          -- dapwidgets.centered_float(dapwidgets.scopes)
        end,
        desc = "Hover",
      },
      {
        "<leader>dd",
        "<cmd>DapToggleBreakpoint<cr>",
        desc = "Toggle Breakpoint",
      },
      { "<leader>dq", "<cmd>DapTerminate<cr>", desc = "Terminate" },
      {
        "<leader>dt",
        function()
          dapui.toggle()
        end,
        desc = "Toggle Debugger Interface",
      },
      -- { "<leader>df", ":Telescope dap frames<CR>",          desc = "Telescope Frames" },
      -- { "<leader>dB", ":Telescope dap list_breakpoint<CR>", desc = "Telescope List Breakpoints" },
      -- { "<leader>dC", ":Telescope dap commands<CR>",        desc = "Telescope Debugger Commands" },
    })
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
