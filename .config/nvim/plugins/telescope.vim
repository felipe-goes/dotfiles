Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

nmap <leader>b   :Telescope buffers<cr>
nmap <leader>fb  :Telescope file_browser<cr>
nmap <leader>fmd :Telescope media_files<cr>

nmap <leader>ff :Telescope find_files<cr>
nmap <leader>F  :Telescope find_files no_ignore=true<cr>

nmap <leader>r :Telescope live_grep<cr>
nmap <leader>R :Telescope grep_string<cr>

" Git related commands
nmap <leader>gf :Telescope git_files<cr>
nmap <leader>gb :Telescope git_branches<cr>

