local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd [[
try
  colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- Lean & mean status/tabline for vim that's light as air.
vim.cmd [[
  let g:airline_theme = 'dracula'
  let g:airline_powerline_fonts = 1
  let g:airline_skip_empty_sections = 1

  let g:airline_left_sep = ''
  let g:airline_right_sep = ''

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = ' '

  set noshowmode
]]

