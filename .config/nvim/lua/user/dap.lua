local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  vim.notify("Missing dap: dap.lua")
  return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
  vim.notify("Missing dapui: dap.lua")
  return
end

local dapvt_status_ok, dapvt = pcall(require, "nvim-dap-virtual-text")
if not dapvt_status_ok then
  vim.notify("Missing dap-virtual-text: dap.lua")
  return
end

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
  name = "lldb"
}

dap.configurations.cpp = {
  -- Launch Debugger
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end
      return variables
    end,

    -- 
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    runInTerminal = false,
  },
  -- Attach Debugger
  {
    -- If you get an "Operation not permitted" error using this, try disabling YAMA:
    --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    name = "Attach to process",
    type = "lldb",  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
    request = "attach",
    pid = require("dap.utils").pick_process,
    args = {},
    env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end
      return variables
    end,
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

-- require("dap").set_log_level("INFO")
dap.defaults.fallback.terminal_win_cmd = "20split new"
vim.fn.sign_define("DapBreakpoint", {text="", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapBreakpointRejected", {text="", texthl="", linehl="", numhl=""})
vim.fn.sign_define("DapStopped", {text="", texthl="", linehl="", numhl=""})

-- nvim-dap-virtual-text
dapvt.setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

-- dap-ui
dapui.setup({})

