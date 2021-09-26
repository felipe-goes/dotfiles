"  Comments to describe what the line of code below does
"" Actual working code for the .vimrc file but still commented.

" Vim as IDE: Demo
" https://www.youtube.com/watch?v=CcgO_CV3iDo

" General useful configuration
source ~/.vim/configs/config.vim

" Powerline
set runtimepath+=$HOME/.local/lib/python3.9/site-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
" Use 256 colors (Use this setting only if your terminal supports 256 colors)
set t_Co=256

" Plugin Keybindings
source ~/.vim/configs/pluginkeybindings.vim

" General purposes
source ~/.vim/configs/generalkeybindings.vim

" Coc configuration
source ~/.vim/configs/cocconfig.vim
" ALE configuration
source ~/.vim/configs/aleconfig.vim

" Vim-Plug configuration
call plug#begin('~/.vim/plugged')
  " Colorscheme
  Plug 'dracula/vim'
  " File navigation
  Plug 'preservim/nerdtree'
  " Add file type icons to Vim plugins
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
call plug#end()

colorscheme dracula
