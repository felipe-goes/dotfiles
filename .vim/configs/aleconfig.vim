" dense-analysis/ale
let g:ale_linters = {
\   '*':          [],
\   'python':     ['vim-lsp', 'flake9', 'pydocstyle', 'bandit', 'mypy'],
\   'bash':       ['vim-lsp', 'shellcheck'],
\   'vim':        ['vim-lsp', 'vint'],
\   'html':       ['vim-lsp', 'tidy'],
\   'css':        ['vim-lsp', 'stylelint'],
\   'javascript': ['vim-lsp', 'eslint'],
\   'json':       ['vim-lsp', 'eslint']
\}
let g:ale_fixers = {
\  '*':           ['remove_trailing_lines', 'trim_whitespace'],
\  'python':      ['black', 'isort'],
\  'sh':          ['shfmt'],
\  'html':        ['prettier'],
\  'css':         ['prettier'],
\  'javascript':  ['prettier', 'fixjson'],
\  'json':        ['fixjson']
\}
let g:ale_fix_on_save = 1
