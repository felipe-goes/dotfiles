" dense-analysis/ale
let g:ale_linters = {
\   '*': [],
\   'python': ['vim-lsp', 'flake8', 'pydocstyle', 'bandit', 'mypy'],
\   'bash': ['vim-lsp', 'shellchecker'],
\   'vim': ['vim-lsp', 'vint']
\}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'python': ['black', 'isort'],
\  'sh': ['shfmt']
\}
let g:ale_fix_on_save = 1
