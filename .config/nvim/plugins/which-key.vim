" Create key bindings that stick.
" WhichKey is a lua plugin for Neovim 0.5 that displays a popup with possible
" keybindings of the command you started typing. 
Plug 'folke/which-key.nvim'

function WhichKeySetup()
lua << EOF
require("which-key").setup {}
EOF
endfunction

augroup WhichKeySetup
    autocmd!
    autocmd User PlugLoaded call WhichKeySetup()
augroup END
