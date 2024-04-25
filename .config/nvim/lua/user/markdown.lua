local status_ok, markdown_preview = pcall(require, "markdown-preview")
if not status_ok then
  vim.notify("Missing markdown-preview: markdown.lua")
  return
end

vim.cmd [[
  let g:mkdp_theme = 'light'
  let g:mkdp_command_for_global = 1
]]
