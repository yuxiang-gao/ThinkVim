let g:spaceline_line_symbol = 0
let g:lightline = extend(get(g:, 'lightline', {}),{
    \   'colorscheme': 'nord',
    \   'active': {
    \       'left': [ [ 'lineMode', 'mode', 'paste' ],
    \               [ 'gitbranch' ],
    \               [ 'readonly', 'filetype', 'filename', 'fileSize']],
    \       'right': [ ['statusLineInfo'],
    \               [ 'fileformat', 'fileEncod' ],
    \               ['errorHeart','cocError','cocWarn',],
    \               [ 'currentfunction' ], 
    \               ['cocStatus']]
    \   },
    \   'component_expand': {
    \   },
    \   'component_type': {
    \       'readonly': 'error',
    \       'linter_warnings': 'warning',
    \       'linter_errors': 'error'
    \   },
    \   'component_function': {
    \       'fileencoding': 'LfileEncoding',
    \       'filename': 'spaceline#spaceline#VimacsFilenameActive',
    \       'fileformat': 'spaceline#spaceline#VimacsLineFileformat',
    \       'filetype': 'spaceline#spaceline#VimacsLineFiletype',
    \       'gitbranch': 'spaceline#spaceline#VimacsLineGit',
    \       'cocStatus': 'spaceline#spaceline#CocStatusBar',
    \       'cocError' : 'spaceline#spaceline#VimacsLineCocError',
    \       'cocWarn' : 'spaceline#spaceline#VimacsLineCocWarn',
    \       'currentfunction': 'LcurrentFunction',
    \       'gitblame': 'LgitBlame',
    \       'statusLineInfo': 'spaceline#spaceline#VimacsLineinfo',
    \       'fileSize': 'spaceline#spaceline#Filesize',
    \       'fileEncod': 'paceline#spaceline#FileEncoding',
    \       'errorHeart': 'spaceline#spaceline#HeartErrorSymbol',
    \       'lineMode': 'spaceline#spaceline#VimacslineMode'
    \   },
    \   'tabline': {
    \       'left': [ [ 'tabs' ] ],
    \       'right': [ [ 'close' ] ]
    \   },
    \   'tab': {
    \       'active': [ 'tabnum', 'modified', 'readonly', ],
    \       'inactive': [ 'tabnum', 'filename', 'modified', 'readonly', ],
    \   },
    \ 'tab_component_function': {
    \   'filename': 'helpers#lightline_powerful#tabfilename',
    \   'readonly': 'helpers#lightline_powerful#tabreadonly',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\ }, 'keep')

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

function! LfileName() abort
    let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
    if filename =~ 'NERD_tree'
        return ''
    endif
    let modified = &modified ? ' +' : ''
    return fnamemodify(filename, ":~:.") . modified
endfunction

function! LfileEncoding()
    " only show the file encoding if it's not 'utf-8'
    return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

function! LfileFormat()
    " only show the file format if it's not 'unix'
    let format = &fileformat == 'unix' ? '' : &fileformat
    return winwidth(0) > 70 ? format . ' ' . WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! LfileType()
    return WebDevIconsGetFileTypeSymbol()
endfunction

" function! LgitBranch()
"     return "\uE725" . (exists('*fugitive#head') ? ' ' . fugitive#head() : '')
" endfunction
function! LgitBranch()
    if &filetype ==? 'defx'
       return ""
    endif
    let gitbranch=get(g:, 'coc_git_status', '')
    let gitcount=get(b:, 'coc_git_status', '')
    let gitinfo = []
    if empty(gitbranch)
	    let gitbranch=""
        return ""
    endif
    if empty(gitcount)
	    let gitcount=""
    endif
    call add(gitinfo,gitbranch)
    call add(gitinfo,gitcount)
    return trim(join(gitinfo,''))
endfunction

function! LcurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LgitBlame()
    return winwidth(0) > 100 ? strpart(substitute(get(b:, 'coc_git_blame', ''), '[\(\)]', '', 'g'), 0, 50) : ''
    " return winwidth(0) > 100 ? strpart(get(b:, 'coc_git_blame', ''), 0, 20) : ''
endfunction