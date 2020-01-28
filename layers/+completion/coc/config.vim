"CoC configlet 
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:coc_status_error_sign = ''
let g:coc_status_warning_sign = ''
let g:coc_global_extensions =['coc-html','coc-css','coc-vetur','coc-snippets','coc-prettier','coc-eslint','coc-emmet','coc-tsserver','coc-pairs','coc-json','coc-python','coc-imselect','coc-highlight','coc-git','coc-emoji','coc-lists','coc-post','coc-stylelint','coc-yaml','coc-template','coc-tabnine','coc-marketplace','coc-gitignore','coc-yank','coc-explorer','coc-go',
    \ 'coc-tslint-plugin',
    \ 'coc-sh',
    \ 'coc-vimlsp',
    \ 'coc-omnisharp',
    \ 'coc-texlab',
    \ 'coc-actions',
    \ 'coc-vimtex',
    \ 'coc-bibtex',
    \ 'coc-terminal',
    \ 'coc-docker',
    \ 'coc-ccls',
    \ 'coc-syntax',
    \ 'coc-emoji',
    \ 'coc-word',
    \ 'coc-tag',
    \ 'coc-spell-checker',
    \ 'coc-markmap',
    \ 'coc-bookmark',
    \ 'coc-kite',
    \ 'coc-markdownlint',
    \ 'coc-browser',
    \]

augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Format :call CocAction('format')
vmap <LocalLeader>f  <Plug>(coc-format-selected)
nmap <LocalLeader>f  <Plug>(coc-format-selected)

vmap <LocalLeader>F :Format<CR> 
nmap <LocalLeader>F :Format<CR>