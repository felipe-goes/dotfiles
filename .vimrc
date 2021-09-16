"  Comments to describe what the line of code below does
"" Actual working code for the .vimrc file but still commented. 

" General useful configuration
source ~/.vim/config

" Powerline
set rtp+=$HOME/.local/lib/python3.9/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colors (Use this setting only if your terminal supports 256 colors)
set t_Co=256

" Plugin Keybindings
source ~/.vim/pluginkeybindings

" General purposes
source ~/.vim/generalkeybindings

" Lsp configuration for prabirshrestha/vim-lsp
source ~/.vim/lspconfig

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
  " LSP configuration
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  " Autocompletion
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  " Run your tests at the speed of thought
  Plug 'vim-test/vim-test'
call plug#end()

colorscheme dracula
