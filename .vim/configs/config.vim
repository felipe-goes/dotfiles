" Always show statusline
set laststatus=2
" Use 256 colors (Use this setting only if your terminal supports 256 colors)
set t_Co=256

" Set the completion option
set completeopt=menuone,noinsert,noselect

" Enable a menu at the bottom of the vim window
set wildmenu

" Enable mouse
set mouse=a

" Set split behavior
set splitright
set splitbelow

" Set diff option
set diffopt+=vertical

" Enable hidden files. Already setted for coc.nvim plugin.
" set hidden

" Disable backups. Already setted for coc.nvim plugin.
" set nobackup
" set nowritebackup

" Set command height. Already setted for coc.nvim plugin.
" set cmdheight=1

" Suppress some messages. Already setted for coc.nvim plugin.
" set shortmess+=c

" Enable sign column
set signcolumn=yes

" Set updatetime. Already setted for coc.nvim plugin.
" set updatetime=300

" Making the system clipboard accessible by Vim
set clipboard=unnamed

" Set how many blank spaces one indent will have
set tabstop=2
set shiftwidth=2

" Use spaces instead of TAB
set expandtab

" Make backspace respect indentation
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

" Show at least this amount of lines around the cursor when possible
set scrolloff=8

" Configure folding behavior
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Do not create swapfiles
set noswapfile

" Set column delimiter
set colorcolumn=90

" Remove banner from file explorer
let g:netrw_banner=0

" Add syntax highlighting
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']
