" Lsp configuration for prabirshrestha/vim-lsp
" Python
if executable('pyls')
  " pip install python-language-server
  augroup LspPython
    autocmd!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'whitelist': ['python'],
          \ })
  augroup END
endif

" Bash
if executable('bash-language-server')
  augroup LspBash
    autocmd!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  augroup END
endif

" Vim
if executable('vim-language-server')
  augroup LspVim
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'vim-language-server',
      \ 'cmd': {server_info->['vim-language-server', '--stdio']},
      \ 'whitelist': ['vim'],
      \ 'initialization_options': {
        \   'vimruntime': $VIMRUNTIME,
        \   'runtimepath': &rtp,
        \ }})
  augroup END
endif

" HTML
if executable('html-languageserver')
  augroup LspHtml
    autocmd!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'html-languageserver',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
          \ 'whitelist': ['html'],
          \ })
  augroup END
endif

" CSS
if executable('css-languageserver')
  augroup LspCss
    autocmd!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'css-languageserver',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
          \ 'whitelist': ['css', 'less', 'sass'],
          \ })
  augroup END
endif

" Javascript
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
      \ })
endif


function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gh <plug>(lsp-hover)
  nmap <buffer> gH <plug>(lsp-code-action)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> <c-k> <plug>(lsp-signature-help)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  inoremap <buffer> <expr><c-f> lsp#scroll(+4)
  inoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
