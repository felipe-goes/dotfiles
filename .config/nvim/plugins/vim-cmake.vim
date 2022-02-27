" Vim/Neovim plugin for working with CMake projects
Plug 'cdelledonne/vim-cmake'

let g:cmake_link_compile_commands = 1

nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>
nmap <leader>cq :CMakeClose<cr>

