" markdown preview plugin for (neo)vim.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

nnoremap <leader>md :MarkdownPreviewToggle<cr>
