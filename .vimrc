"  Comments to describe what the line of code below does
"" Actual working code for the .vimrc file but still commented. 

" Generally useful configuration
  " Set how many blank spaces one indent will have
  set tabstop=2
  set shiftwidth=2

  " Use spaces instead of TAB
  set expandtab

  " Make backspace respect identation
  set softtabstop=2

  " Tells vim to identify the file type to adapt colorscheme
  " to the extension of the file
  filetype plugin indent on
  syntax on

  " Set the expected behavior for the backspace key on the keyboard
  set backspace=2

  " Make Vim show the number of lines
  set number

  " Make calculation of line distance
  set relativenumber

  " Incremental search. Feedback while searching
  set incsearch

  " Highlight search results
  set hlsearch

  " Set search to be case insensitive
  set ignorecase
  set smartcase

  " Highlight the current line
  set cursorline

" Powerline
  set rtp+=$HOME/.local/lib/python3.9/site-packages/powerline/bindings/vim/
  " Always show statusline
  set laststatus=2
  " Use 256 colors (Use this setting only if your terminal supports 256 colors)
  set t_Co=256

" Keybindings
  nmap <C-p> :Files<enter>            " For fzf
  nmap <C-g> :G<enter>                " For vim-fugitive
  nmap <C-m> :MarkdownPreview<enter>  " For markdown-preview
  nmap <F2>  :NERDTreeToggle<enter>   " For NERDTree

" Vim-Plug configuration
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'powerline/powerline'
  Plug 'tpope/vim-fugitive' " For git integration
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file. Search for files.
  Plug 'junegunn/fzf.vim'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'dracula/vim'
call plug#end()

colorscheme dracula
