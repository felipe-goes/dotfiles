"  Comments to describe what the line of code below does
"" Actual working code for the .vimrc file but still commented.

" Vim as IDE: Demo
" https://www.youtube.com/watch?v=CcgO_CV3iDo

" General useful configuration
source ~/.vim/configs/config.vim
" General purposes
source ~/.vim/configs/keybindings.vim

" Plugins Keybindings
source ~/.vim/configs/plugins.vim
" Vim-airline
source ~/.vim/configs/airline.vim
" Coc
source ~/.vim/configs/coc.vim
" ALE
source ~/.vim/configs/ale.vim

" Vim-Plug configuration
call plug#begin('~/.vim/plugged')
  " Colorscheme
  Plug 'dracula/vim'
  " File navigation
  Plug 'preservim/nerdtree'
  " Add file type icons to Vim plugins
  Plug 'ryanoasis/vim-devicons'
  " Lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
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
  " Nodejs extension host for vim and neovim, load extensions like VSCode and
  " host language servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Check syntax in Vim asynchronously and fix files, with LSP support
  Plug 'dense-analysis/ale'
  " Run your tests at the speed of thought
  Plug 'vim-test/vim-test'
  " A multi-language debugging system for Vim
  Plug 'puremourning/vimspector'
  " Emmet for Vim
  Plug 'mattn/emmet-vim'
  " Auto close (X)HTML tags
  Plug 'alvan/vim-closetag'
  " Preview colours in source code while editing
  Plug 'ap/vim-css-color'
  " Personal Wiki for Vim
  Plug 'vimwiki/vimwiki'
call plug#end()

colorscheme dracula
