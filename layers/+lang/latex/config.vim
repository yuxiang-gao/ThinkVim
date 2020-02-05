let g:vimtex_view_enabled=1
let g:vimtex_view_use_temp_files=1
let g:vimtex_view_method='zathura'
let g:vimtex_fold_enabled=1
let g:vimtex_fold_levelmarker='❯❯❯'
let g:vimtex_format_enabled=1

let g:vimtex_quickfix_autoclose_after_keystrokes=1
" Disable all warnings
let g:vimtex_quickfix_latexlog = {'default' : 0}

" Disable undefined reference warnings
let g:vimtex_quickfix_latexlog = {'references' : 0}

" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_latexlog = {
        \ 'overfull' : 0,
        \ 'underfull' : 0,
        \ 'packages' : {
        \   'default' : 0,
        \ },
        \}