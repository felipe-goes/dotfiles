" __________      ___________                     ________________
" ___  ____/_____ ___  /___(_)________ _____      __  ____/____/_/_____ ________
" __  /_    _  _ \__  / __  / ___  __ \_  _ \     _  / __  _  __ \_  _ \__  ___/
" _  __/    /  __/_  /  _  /  __  /_/ //  __/     / /_/ /  / /_/ //  __/_(__  )
" /_/       \___/ /_/   /_/   _  .___/ \___/      \____/   \____/ \___/ /____/
"                             /_/
" Email:   ogoesfelipe@gmail.com
" Twitter: @felipeogoes
"
" Forked of personal vim configuration of Jess Archer <jess@jessarcher.com>

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------

set noswapfile
set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set colorcolumn=80
set relativenumber
set number
set termguicolors
set undofile
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set nobackup      "" Some servers have issues with backup files, see #649
set nowritebackup "" Some servers have issues with backup files, see #649
set shortmess+=c  "" don't give |ins-completion-menu| messages.
" set backup
" set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>nhl :nohlsearch<cr>
nmap <leader>Q   :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Map <leader>w to write file
nnoremap <leader>w :w<cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y y$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quickly escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
imap ;; <esc>A;<esc>
imap ,, <esc>A,<esc>

cmap w!! %!sudo tee > /dev/null %

" Moving text
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
inoremap <C-j> <esc>:m .+1<cr>==i
inoremap <C-k> <esc>:m .-2<cr>==i
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==

" Quickly insert an empty new line without entering insert mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Change language
nnoremap <leader>pt :setlocal spell spelllang=pt<cr>
nnoremap <leader>en :setlocal spell spelllang=en_us<cr>
nnoremap <leader>pe :setlocal spell spelllang=pt,en_us<cr>

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/airline.vim
" source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/context-commentstring.vim
source ~/.config/nvim/plugins/devicons.vim
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/eunuch.vim
source ~/.config/nvim/plugins/exchange.vim
source ~/.config/nvim/plugins/firenvim.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/lastplace.vim
source ~/.config/nvim/plugins/lion.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/nvim-lspconfig.vim
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/peekaboo.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/repeat.vim
source ~/.config/nvim/plugins/rooter.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/smooth-scroll.vim
source ~/.config/nvim/plugins/splitjoin.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/targets.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/textobj-xmlattr.vim
source ~/.config/nvim/plugins/tmux-navigator.vim
source ~/.config/nvim/plugins/unimpaired.vim
source ~/.config/nvim/plugins/vim-closetag.vim
source ~/.config/nvim/plugins/vim-cmake.vim
source ~/.config/nvim/plugins/vim-codefmt.vim
source ~/.config/nvim/plugins/vim-csscolor.vim
source ~/.config/nvim/plugins/vim-glaive.vim
source ~/.config/nvim/plugins/vim-maktaba.vim
source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/visual-multi.vim
source ~/.config/nvim/plugins/visual-star-search.vim
source ~/.config/nvim/plugins/which-key.vim

call plug#end()
doautocmd User PlugLoaded

"--------------------------------------------------------------------------
" Lua
"--------------------------------------------------------------------------

lua require("user")

"--------------------------------------------------------------------------
" SGDK
"--------------------------------------------------------------------------

" Build SGDK projects with Docker and open the generated rom in BizHawk or
" BlastEm
nnoremap <leader>sg   :!/home/felipe/.sgdk/build-sgdk.sh<cr>
nnoremap <leader>sgbh :!/home/felipe/.sgdk/sgdk-bizhawk.sh<cr>
nnoremap <leader>sgbl :!/home/felipe/.sgdk/sgdk-blastem.sh<cr>
nnoremap <leader>nsg  :!/home/felipe/.sgdk/new-sgdk-project.sh<cr>

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------


augroup FileTypeOverrides
    autocmd!
    " Use '//' instead of '/* */' comments
    autocmd FileType php setlocal commentstring=//%s
    autocmd TermOpen * setlocal nospell
    " CPP setup done using this tutorial https://xuechendi.github.io/2019/11/11/VIM-CPP-IDE-2019-111-11-VIM_CPP_IDE
    " Code formatting
    autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
augroup END

