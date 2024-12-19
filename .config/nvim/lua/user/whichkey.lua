local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("Missing which_key: whichkey.lua")
  return
end

local dap = require("dap")
local dapui = require("dapui")
local widgets = require("dap.ui.widgets")
local harpoon = require("harpoon")

local mappings = {}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {}

-- which_key.setup(setup)
-- which_key.register(mappings, opts)
-- which_key.register(vmappings, vopts)

which_key.add({
  -- opts
  {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
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

  -- Do not have a group
  {
    "<leader>m",
    "<cmd>PeekOpen<cr>",
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
  { "<leader>n", "<cmd>Noice dismiss<cr>", desc = "Noice dismiss" },
  {
    "<leader>e",
    function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    desc = "Harpoon",
    icon = {
      icon = "⇀",
      color = "orange",
    },
  },
  {
    "<leader>a",
    function()
      harpoon:list():add()
    end,
    desc = "Add to Harpoon",
    icon = {
      icon = "󰐕",
      color = "orange",
    },
  },

  -- Telescope Find
  { "<leader>f", group = "Telescope Find" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files", mode = "n" },
  { "<leader>fp", "<cmd>Telescope live_grep<cr>", desc = "Text" },
  { "<leader>fh", "<cmd>Telescope find_files hidden=true<cr>", desc = "Hidden Files" },
  { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo" },

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
  { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>lt", "<cmd>Trouble lsp_type_definitions<cr>", desc = "Type Definition" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lI", "<cmd>Mason<cr>", desc = "Install" },
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
  { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sm", "<cmd>Telescope media_files<cr>", desc = "Image Preview" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sR", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },

  -- SGDK
  { "<leader>S", group = "SGDK", icon = { icon = "󰊖", color = "purple" } },
  { "<leader>Sb", "<cmd>!sgdk build<cr>", desc = "Build SGDK Project" },
  { "<leader>Se", "<cmd>!sgdk blastem<cr>", desc = "Build and Run Blastem" },
  { "<leader>Sh", "<cmd>!sgdk bizhawk<cr>", desc = "Build and Run Bizhawk" },
  { "<leader>Sc", "<cmd>!sgdk clean<cr>", desc = "Clean SGDK Project" },
  { "<leader>SC", "<cmd>!sgdk cmake<cr>", desc = "Generate compile_commands.json" },

  -- C/C++
  { "<leader>c", group = "C/C++", icon = { icon = "󰙲", color = "blue" } },
  { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake Generate" },
  { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake Build" },
  { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake Run" },
  { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake Debug" },
  { "<leader>ct", "<cmd>CMakeTest<cr>", desc = "CMake Test" },

  -- Trouble
  { "<leader>t", group = "Trouble", icon = { icon = "󱖫", color = "yellow" } },
  { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "LSP Diagnostics" },
  { "<leader>tt", "<cmd>Trouble lsp_type_definitions toggle<cr>", desc = "LSP Type Definitions" },
  { "<leader>ts", "<cmd>Trouble symbols toggle focus=true<cr>", desc = "LSP Symbols" },
  { "<leader>tT", "<cmd>Trouble todo toggle<cr>", desc = "Todo" },

  -- Test
  { "<leader>T", group = "Test" },
  { "<leader>Ta", "<cmd>TestSuite<cr>", desc = "Test Suite" },
  { "<leader>Tf", "<cmd>TestFile<cr>", desc = "Test File" },
  { "<leader>Tl", "<cmd>TestLast<cr>", desc = "Test Last" },
  { "<leader>Tn", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
  { "<leader>Tv", "<cmd>TestVisit<cr>", desc = "Test Visit" },

  -- Debugger
  -- See more in keymaps.lua
  { "<leader>d", group = "Debugger" },
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
  { "<leader>dq", "<cmd>DapTerminate<cr>", desc = "Close" },
  {
    "<leader>dt",
    function()
      dapui.toggle()
    end,
    desc = "Toggle Debugger Interface",
  },
  { "<leader>df", ":Telescope dap frames<CR>", desc = "Telescope Frames" },
  { "<leader>dB", ":Telescope dap list_breakpoint<CR>", desc = "Telescope List Breakpoints" },
  { "<leader>dC", ":Telescope dap commands<CR>", desc = "Telescope Debugger Commands" },
})
