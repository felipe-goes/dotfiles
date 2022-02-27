Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

nmap <leader>b  :Telescope buffers<cr>
nmap <leader>fm :Telescope media_files<cr>
nmap <leader>fb :Telescope file_browser<cr>

" Git related commands
nmap <leader>gf :Telescope git_files<cr>
nmap <leader>gb :Telescope git_branches<cr>

" Search for file ignoring files in .gitignore.
" Everything | C/CPP/H/HPP | C/CPP | H/HPP
nmap <leader>ff  :Telescope find_files<cr>
nmap <leader>fch :Telescope find_files find_command={'find','.','-type','f','-name','*.c','-or','-name','*.cpp','-or','-name','*.h','-or','-name','*.hpp'}<cr>
nmap <leader>fcc :Telescope find_files find_command={'find','.','-type','f','-name','*.c','-or','-name','*.cpp'}<cr>
nmap <leader>fhh :Telescope find_files find_command={'find','.','-type','f','-name','*.h','-or','-name','*.hpp'}<cr>

" Search for text inside file ignoring files in .gitignore.
" Everything | C/CPP/H/HPP | C/CPP | H/HPP
nmap <leader>rr  :Telescope live_grep<cr>
nmap <leader>rch :Telescope live_grep find_command={'find','.','-type','f','-name','*.c','-or','-name','*.cpp','-or','-name', '*.h', '-or', '-name', '*.hpp'}<cr>
nmap <leader>rcc :Telescope live_grep find_command={'find','.','-type','f','-name','*.c','-or','-name','*.cpp'}<cr>
nmap <leader>rhh :Telescope live_grep find_command={'find','.','-type','f','-name','*.h','-or','-name','*.hpp'}<cr>

nmap <leader>F :Telescope find_files no_ignore=true<cr>
nmap <leader>R :Telescope grep_string<cr>

