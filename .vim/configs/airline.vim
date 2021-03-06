if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Theme
let g:airline_theme = 'dracula'

" Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0

" unicode symbols
let g:airline_left_sep = 'Β»'
let g:airline_left_sep = 'βΆ'
let g:airline_right_sep = 'Β«'
let g:airline_right_sep = 'β'
let g:airline_symbols.crypt = 'π'
let g:airline_symbols.linenr = 'β°'
let g:airline_symbols.linenr = 'β'
let g:airline_symbols.linenr = 'β€'
let g:airline_symbols.linenr = 'ΒΆ'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = 'γ'
let g:airline_symbols.branch = 'β'
let g:airline_symbols.paste = 'Ο'
let g:airline_symbols.paste = 'Γ'
let g:airline_symbols.paste = 'β₯'
let g:airline_symbols.spell = 'κ¨'
let g:airline_symbols.notexists = 'Ι'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = 'ξ°'
let g:airline_left_alt_sep = 'ξ±'
let g:airline_right_sep = 'ξ²'
let g:airline_right_alt_sep = 'ξ³'
let g:airline_symbols.branch = 'ξ '
let g:airline_symbols.readonly = 'ξ’'
let g:airline_symbols.linenr = 'β°'
let g:airline_symbols.maxlinenr = 'ξ‘'

" powerline fonts
let g:airline_powerline_fonts = 1
