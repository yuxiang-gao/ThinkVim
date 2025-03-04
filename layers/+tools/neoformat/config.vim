
let g:neoformat_try_formatprg = 1
let g:jsx_ext_required = 0
let g:neoformat_enabled_javascript=['prettier']
let g:neoformat_enabled_html=['js-beautify']


let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']

let g:neoformat_enabled_rust = ['rustfmt']
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1