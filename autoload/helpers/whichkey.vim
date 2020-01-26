function! helpers#whichkey#exclude_type() abort
    let type = &filetype
    if type == 'defx' || type =='coc-explorer'
        return 0
    endif
    return 1
endfunction