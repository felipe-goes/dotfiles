" Make Vim recognize a file type as you wish
nnoremap <leader>ft :set ft=

" Go to normal mode
:inoremap <C-l> <esc>

" Make Y behave as expected
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

" Quickly insert an empty new line without entering insert mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Add shortcut to edit the .vimrc
nnoremap <leader>v :e $MYVIMRC<CR>

" Shortcuts for resizing the window
" if bufwinnr(1)
nnoremap - <C-W>-
nnoremap + <C-W>+
nnoremap , <C-W><
nnoremap ; <C-W>>
" endif

" Move between tabs
nnoremap H gT
nnoremap L gt
