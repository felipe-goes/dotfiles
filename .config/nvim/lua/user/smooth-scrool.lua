vim.cmd("noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 1)<CR>")
vim.cmd("noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 1)<CR>")
vim.cmd("noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 2)<CR>")
vim.cmd("noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 2)<CR>")