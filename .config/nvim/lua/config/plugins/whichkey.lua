return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local widgets = require("dap.ui.widgets")

    local which_key = require("which-key")
    which_key.add({
      -- opts
      {
        mode = "n",     -- NORMAL mode
        prefix = "<leader>",
        buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true,  -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true,  -- use `nowait` when creating keymaps
      },

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
        "<leader>m",
        "<cmd>Glow<cr>",
        desc = "Markdown Preview",
        icon = {
          icon = "󰍔",
          color = "blue",
        },
      },
      {
        "<leader>p",
        "<cmd>Oil --float<cr>",
        desc = "Explorer",
        icon = {
          icon = "󰉋",
          color = "blue",
        },
      },
      { "<leader>n",  "<cmd>Noice dismiss<cr>",        desc = "Noice dismiss" },

      -- Telescope Find
      { "<leader>f",  group = "Telescope Find" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files",        mode = "n" },
      -- "<leader>fp" was implemented in multigrep.lua file
      {
        "<leader>fn",
        "<cmd>lua require'telescope.builtin'.find_files { cwd = vim.fn.stdpath('config') }<cr>",
        desc = "Neovim Files",
        mode = "n",
      },
      { "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", desc = "Hidden Files" },
      { "<leader>fb", "<cmd>Telescope buffers theme=ivy<cr>", desc = "Buffers" },
      { "<leader>ft", "<cmd>TodoTelescope theme=ivy<cr>", desc = "Todo" },

      -- Git
      { "<leader>g", group = "Git" },
      { "<leader>gi", "<cmd>Neogit<cr>", desc = "Neogit Interface" },
      { "<leader>gj", "<cmd>lua require'gitsigns'.next_hunk()<cr>", desc = "Next Hunk = ]g" },
      { "<leader>gk", "<cmd>lua require'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk = [g" },
      { "<leader>gb", "<cmd>lua require'gitsigns'.blame_line()<cr>", desc = "Blame" },
      { "<leader>gp", "<cmd>lua require'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
      { "<leader>gr", "<cmd>lua require'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
      { "<leader>gR", "<cmd>lua require'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
      { "<leader>gs", "<cmd>lua require'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
      { "<leader>gu", "<cmd>lua require'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
      { "<leader>gd", "<cmd>lua require'gitsigns'.diffthis() HEAD<cr>", desc = "Diff File" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Diff Close" },
      { "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", desc = "Diff Toggle" },
      { "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },

      -- LSP
      { "<leader>l", group = "LSP", icon = { icon = "", color = "green" } },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      {
        "<leader>lf",
        function()
          vim.lsp.buf.format({ async = true })
          vim.defer_fn(function()
            vim.diagnostic.show()
          end, 250) -- Delay the diagnostic refresh slightly to ensure it happens after formatting
        end,
        desc = "Format",
      },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",       desc = "Rename" },
      { "<leader>lt", "<cmd>Trouble lsp_type_definitions<cr>",   desc = "Type Definition" },
      { "<leader>li", "<cmd>LspInfo<cr>",                        desc = "Info" },
      { "<leader>lI", "<cmd>Mason<cr>",                          desc = "Install" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      {
        "<leader>lS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        desc = "Workspace Symbols",
      },

      -- LSP Diagnostics
      { "<leader>ld", group = "LSP Diagnostics" },
      { "<leader>ldd", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Hover" },
      { "<leader>ldl", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
      { "<leader>ldj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next = ]d" },
      { "<leader>ldk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Prev = [d]" },

      -- LSP Workspace
      { "<leader>lw", group = "LSP Workspace" },
      { "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", desc = "Add Workspace Folder" },
      { "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", desc = "Remove Workspace Folder" },
      { "<leader>lwl", "<cmd>lua vim.lsp.buf.list_workspace_folders()<cr>", desc = "List Workspace Folders" },

      -- Icon Picker
      { "<leader>i", group = "Icon Picker", icon = { icon = "", color = "yellow" } },
      { "<leader>ia", "<cmd>IconPickerNormal<cr>", desc = "Pick Icons" },
      { "<leader>in", "<cmd>IconPickerNormal nerd_font nerd_font_v3<cr>", desc = "Pick Nerd Font" },
      { "<leader>ie", "<cmd>IconPickerNormal emoji<cr>", desc = "Pick Emoji" },
      { "<leader>is", "<cmd>IconPickerNormal symbols<cr>", desc = "Pick Symbol" },
      { "<leader>if", "<cmd>IconPickerNormal alt_font<cr>", desc = "Pick Alt Font" },
      { "<leader>ih", "<cmd>IconPickerNormal html_colors<cr>", desc = "Pick HTML Colors" },

      -- Search
      { "<leader>s", group = "Search" },
      { "<leader>sc", "<cmd>Telescope commands theme=ivy<cr>", desc = "Commands" },
      { "<leader>sh", "<cmd>Telescope help_tags theme=ivy<cr>", desc = "Find Help" },
      { "<leader>sr", "<cmd>Telescope registers theme=ivy<cr>", desc = "Registers" },
      { "<leader>sk", "<cmd>Telescope keymaps theme=ivy<cr>", desc = "Keymaps" },
      { "<leader>sR", "<cmd>Telescope oldfiles theme=ivy<cr>", desc = "Open Recent File" },

      -- SGDK
      { "<leader>S", group = "SGDK", icon = { icon = "󰊖", color = "purple" } },
      { "<leader>Sb", "<cmd>!sgdk build<cr>", desc = "Build SGDK Project" },
      { "<leader>Se", "<cmd>!sgdk blastem<cr>", desc = "Build and Run Blastem" },
      { "<leader>Sh", "<cmd>!sgdk bizhawk<cr>", desc = "Build and Run Bizhawk" },
      { "<leader>Sc", "<cmd>!sgdk clean<cr>", desc = "Clean SGDK Project" },
      { "<leader>SC", "<cmd>!sgdk cmake<cr>", desc = "Generate compile_commands.json" },

      -- C/C++
      { "<leader>c", group = "C/C++", icon = { icon = "󰙲", color = "blue" } },
      {
        "<leader>cR",
        "<cmd>!cmake -B build/release -DCMAKE_BUILD_TYPE=Release && cp -f build/release/compile_commands.json .<cr>",
        desc = "CMake gRelease",
      },
      {
        "<leader>cD",
        "<cmd>!cmake -B build/debug -DCMAKE_BUILD_TYPE=Debug && cp -f build/debug/compile_commands.json .<cr>",
        desc = "CMake gDebug",
      },
      { "<leader>cr", "<cmd>!cmake --build build/release<cr>", desc = "CMake bRelease" },
      { "<leader>cd", "<cmd>!cmake --build build/debug<cr>",   desc = "CMake bDebug" },
      { "<leader>cc", "<cmd>!rm -rf build<cr>",                desc = "CMake Clean" },
      {
        "<leader>ct",
        "<cmd>!cmake --build build/release/ --target help | tail -n +13 | awk '{print $2}'<cr>",
        desc = "CMake Targets",
      },
      {
        "<leader>cT",
        "<cmd>!cmake --build build/release/ --target help | tail -n +13 | awk '{print $2}' | grep Test<cr>",
        desc = "CMake Test Targets",
      },

      -- Trouble
      { "<leader>t", group = "Trouble", icon = { icon = "󱖫", color = "yellow" } },
      { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "LSP Diagnostics" },
      { "<leader>tt", "<cmd>Trouble lsp_type_definitions toggle<cr>", desc = "LSP Type Definitions" },
      { "<leader>ts", "<cmd>Trouble symbols toggle focus=true<cr>", desc = "LSP Symbols" },
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
      { "<leader>dO", "<cmd>DapStepOut<cr>",  desc = "Step Out" },
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
          widgets.hover()
          -- widgets.centered_float(widgets.scopes)
        end,
        desc = "Hover",
      },
      { "<leader>dd", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
      { "<leader>dq", "<cmd>DapTerminate<cr>",        desc = "Terminate" },
      {
        "<leader>dt",
        function()
          dapui.toggle()
        end,
        desc = "Toggle Debugger Interface",
      },
      { "<leader>df", ":Telescope dap frames<CR>",          desc = "Telescope Frames" },
      { "<leader>dB", ":Telescope dap list_breakpoint<CR>", desc = "Telescope List Breakpoints" },
      { "<leader>dC", ":Telescope dap commands<CR>",        desc = "Telescope Debugger Commands" },
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
