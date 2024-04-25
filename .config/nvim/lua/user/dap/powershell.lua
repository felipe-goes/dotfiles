local powershell = require("dap-powershell")

powershell.setup({
  include_configs = true,
  pwsh_executable = "pwsh",
  pses_bundle_path = "/home/felipe/.local/share/nvim/mason/packages/powershell-editor-services",
})
