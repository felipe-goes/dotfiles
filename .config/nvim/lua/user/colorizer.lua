local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  vim.notify("Missing colorizer: colorizer.lua")
  return
end

colorizer.setup()

