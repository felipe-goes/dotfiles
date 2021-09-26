" dense-analysis/ale
let g:ale_linters = {
\   '*':          [],
\   'python':     ['flake8', 'pydocstyle', 'bandit', 'mypy'],
\   'bash':       ['shellcheck'],
\   'vim':        ['vint'],
\   'html':       ['tidy'],
\   'css':        ['stylelint'],
\   'javascript': ['prettier'],
\   'json':       ['prettier']
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
