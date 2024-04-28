local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  vim.notify("Missing which_key: whichkey.lua")
  return
end

local dap = require("dap")
local dapui = require("dapui")

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "j" },
    v = { "j", "j" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  h = { "<cmd>nohlsearch<cr>", "No Highlight" },
  m = { "<cmd>MarkdownPreview<cr>", "Markdown Preview" },
  f = { "<cmd>Telescope find_files<cr>", "Find Files" },
  F = { "<cmd>Telescope live_grep<cr>", "Find Text" },
  H = { "<cmd>Telescope find_files hidden=true<cr>", "Find Hidden Files" },
  L = { "<cmd>BufferLineTogglePin<cr>", "Lock Buffer" },

  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    S = { "<cmd>Telescope git_status<cr>", "Git Status" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
    c = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    C = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff File" },
    D = { "<cmd>DiffviewOpen<cr>", "Diff View" },
    q = { "<cmd>DiffviewClose<cr>", "Diff Close" },
    t = { "<cmd>DiffviewToggleFiles<cr>", "Diff Toggle" },
    f = { "<cmd>DiffviewFileHistory<cr>", "Project File History" },
    F = { "<cmd>DiffviewFileHistory %<cr>", "Current File History" },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Hover Diagnostics" },
    D = {
      "<cmd>Telescope lsp_document_diagnostics<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
    i = { "<cmd>Mason<cr>", "Info" },
    k = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
      "Prev Diagnostic",
    },
    j = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>",
      "Next Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },

  i = {
    name = "Icon Picker",
    i = { "<cmd>PickIcons<cr>", "Pick Icons & Emoji" },
    s = { "<cmd>PickSymbols<cr>", "Pick Symbols" },
    a = { "<cmd>PickAltFont<cr>", "Pick Alt Font" },
  },

  s = {
    name = "Search",
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    m = { "<cmd>Telescope media_files<cr>", "Image Preview" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  },

  o = {
    name = "Outros",
    f = { "<cmd>ToggleTerm direction=float<cr>", "Terminal Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Terminal Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Terminal Vertical" },
  },

  S = {
    name = "SGDK",
    b = { "<cmd>!sgdk build<cr>", "Build SGDK Project" },
    e = { "<cmd>!sgdk blastem<cr>", "Build and Run Blastem" },
    h = { "<cmd>!sgdk bizhawk<cr>", "Build and Run Bizhawk" },
    c = { "<cmd>!sgdk clean<cr>", "Clean SGDK Project" },
    C = { "<cmd>!sgdk cmake<cr>", "Generate compile_commands.json" },
  },

  c = {
    name = "C/C++",
    c = { ":!create-cpp-class ", "Create C++ Class" },
    b = { "<cmd>CMake build<cr>", "CMake Build" },
    B = { "<cmd>CMake build_all<cr>", "CMake Build All" },
    r = { "<cmd>CMake build_and_run<cr>", "CMake Build & Run" },
    d = { "<cmd>CMake build_and_debug<cr>", "CMake Build & Debug" },
    s = { "<cmd>CMake select_target<cr>", "CMake Select Target" },
    S = { "<cmd>CMake select_build_type<cr>", "CMake Select Build Type" },
  },

  t = {
    name = "Test",
    a = { "<cmd>TestSuite<cr>", "Test Suite" },
    f = { "<cmd>TestFile<cr>", "Test File" },
    l = { "<cmd>TestLast<cr>", "Test Last" },
    n = { "<cmd>TestNearest<cr>", "Test Nearest" },
    v = { "<cmd>TestVisit<cr>", "Test Visit" },
  },

  -- See more in keymaps.lua
  d = {
    name = "Debugger",
    b = {
      function()
        dap.toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    R = {
      function()
        dap.clear_breakpoints()
      end,
      "Clear Breakpoints",
    },
    n = {
      function()
        dap.run_to_cursor()
      end,
      "Run to Cursor",
    },
    c = {
      function()
        dap.terminate()
      end,
      "Terminate",
    },
    e = {
      function()
        dap.set_exception_breakpoints()
      end,
      "Set Exception Breakpoints",
    },
    h = {
      function()
        dap.ui.widgets.hover()
      end,
      "Hover",
    },
    q = {
      function()
        dapui.toggle()
      end,
      "Toggle Debugger Interface",
    },
    f = { ":Telescope dap frames<CR>", "Telescope Frames" },
    B = { ":Telescope dap list_breakpoint<CR>", "Telescope List Breakpoints" },
    C = { ":Telescope dap commands<CR>", "Telescope Debugger Commands" },
  },
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
