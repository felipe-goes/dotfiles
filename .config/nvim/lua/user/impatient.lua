local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  vim.notify("Missing impatient: impatient.lua")
  return
end

impatient.enable_profile()

