"  Comments to describe what the line of code below does
"" Actual working code for the .vimrc file but still commented. 

" Generally useful configuration
  " Set the completion option
  set completeopt=menuone,noinsert,noselect

  " Enable mouse
  set mouse=a

  " Set split behavior
  set splitright
  set splitbelow

  " Set diff option
  set diffopt+=vertical

  " Enable hidden files
  set hidden

  " Disable backups
  set nobackup
  set nowritebackup

  " Set command height
  set cmdheight=1

  " Suppress some messages
  set shortmess+=c

  " Enable sign column
  set signcolumn=yes

  " Set updatetime
  set updatetime=750

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

" Powerline
  set rtp+=$HOME/.local/lib/python3.9/site-packages/powerline/bindings/vim/
  " Always show statusline
  set laststatus=2
  " Use 256 colors (Use this setting only if your terminal supports 256 colors)
  set t_Co=256

" Keybindings
  " Plugins
    " For fzf
    nnoremap <C-p>      :Files<CR>
    " For vim-fugitive
    nnoremap <C-g>      :G<CR>
    " For markdown-preview
    nnoremap <C-m>      :MarkdownPreview<CR>
    " For NERDTree
    nnoremap <F2>       :NERDTreeToggle<CR>
    nnoremap <leader>h  :wincmd h<CR>
    nnoremap <leader>j  :wincmd j<CR>
    nnoremap <leader>k  :wincmd k<CR>
    nnoremap <leader>l  :wincmd l<CR>
    " You Complete Me
    nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
    " Hard Time
    nnoremap <leader>ht :HardTimeToggle<CR>
    " Neoterm
    let g:neoterm_default_mod = 'vertical'
    let g:neoterm_size = 60
    nnoremap <c-q> :Ttoggle<CR>
    inoremap <c-q> <esc>:Ttoggle<CR>
    tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>
    " Neoformat
    nnoremap <leader>F :Neoformat prettier<CR>

  " General purposes
    " Go to normal mode
    :inoremap <C-l>       <esc>
    " For working with tabs
    nnoremap <C-t>        :tabe 
    nnoremap <leader>,    :tabp<CR>
    nnoremap <leader>;    :tabn<CR>
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

" Vim-Plug configuration
call plug#begin('~/.vim/plugged')
  " Colorscheme
  Plug 'dracula/vim'
  " File navigation
  Plug 'preservim/nerdtree'
  " Still not working. The intent is to show icons in NERDTree
  Plug 'ryanoasis/nerd-fonts'
  Plug 'ryanoasis/vim-devicons'
  " Status line
  Plug 'powerline/powerline'
  " For git integration
  Plug 'tpope/vim-fugitive'
  " Add, replace and remove surroundings
  Plug 'tpope/vim-surround'
  " Comment and uncomment code easier
  Plug 'tpope/vim-commentary'
  " Fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file. Search for files.
  Plug 'junegunn/fzf.vim'
  " Preview markdown files
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  " Syntax checking
  Plug 'vim-syntastic/syntastic'
  " Code completion
  Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --rust-completer' }
  " For cheat sheet integration
  Plug 'dbeniamine/cheat.sh-vim'
  " Replace with specific register content without leaving normal mode
  Plug 'vim-scripts/ReplaceWithRegister'
  " Plugin to help getting used with Vim way of doing
  Plug 'takac/vim-hardtime'
  " Show git diff markers in the sign column and stages/preview/undoes hunks
  " and partial hunks
  Plug 'airblade/vim-gitgutter'
  " Improved Javascript indentation and syntax for Vim
  Plug 'pangloss/vim-javascript'
  " Maximizes and restores the current window in Vim
  Plug 'szw/vim-maximizer'
  " Seamless navigation between tmux panes and vim splits
  Plug 'christoomey/vim-tmux-navigator'
  " Wrapper of some vim/neovim's :terminal functions
  Plug 'kassio/neoterm'
  " For formatting code
  Plug 'sbdchd/neoformat'
call plug#end()

colorscheme dracula
