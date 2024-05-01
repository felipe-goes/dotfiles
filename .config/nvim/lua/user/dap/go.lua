local cmp_status_ok, go = pcall(require, "dap-go")
if not cmp_status_ok then
  vim.notify("Missing nvim-dap-go: go.lua")
  return
end

go.setup()
