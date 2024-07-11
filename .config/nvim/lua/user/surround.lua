local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  vim.notify("Missing nvim-surround: surround.lua")
  return
end

surround.setup()
