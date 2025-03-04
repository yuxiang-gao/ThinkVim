let g:which_key_hspace = 5
let g:which_key_flatten = 1
let g:which_key_max_size = 60
let g:which_key_vertical = 0 " horizontal would crash when windo not wide enough
let g:which_key_position = 'botright'
let g:which_key_sort_horizontal = 0
let g:which_key_floating_relative_win = 0
let g:which_key_fallback_to_native_key=1

let g:which_key_map =  {}
let g:which_key_map = {
      \ 'name' : '+ThinkVim root ' ,
      \ '-' : 'choose window by {prompt char}' ,
      \ 'w' : {
            \ 'name' : '+window-operation',
            \ '1' : 'select window-1'      ,
            \ '2' : 'select window-2'      ,
            \ '3' : 'select window-3'      ,
            \ '4' : 'select window-4'      ,
            \ '5' : 'select window-5'      ,
            \ '6' : 'select window-6'      ,
            \ '7' : 'select window-7'      ,
            \ '8' : 'select window-8'      ,
            \ '9' : 'select window-9'      ,
            \ '0' : 'select window-10'      ,
            \ 'q' : 'close window'         ,
            \ 'qa' : 'close all window'   ,
      \},
      \ 'z' : 'Zoom pane',
      \ 't' : {
            \ 'name' : '+tab-operation',
            \ 'n' : 'new tab',
            \ 'e' : 'edit tab',
            \ 'm' : 'move tab',
            \ 'd' : 'close tab',
            \ 'h' : 'prev tab',
            \ 'l' : 'next tab',
            \ },
      \ 'a' : {
            \ 'name' : '+coc-code-action',
            \ 'c' : 'code action',
            \ },
      \ 'b' : {
            \ 'name' : '+buffer',
            \ 'b' : 'buffer list',
            \ 'c' : 'keep current buffer',
            \ 'o' : 'keep input buffer',
            \ 'd' : 'delete buffer',
            \ },
      \ 'e' : 'open file explorer' ,
      \ 'd' : 'search cursor word on Dash.app' ,
      \ 'G' : 'distraction free writing' ,
      \ 'F' : 'find current file' ,
      \ 'f' : {
            \ 'name' : '+search {files cursorword word outline}',
            \ 'r' : 'find file',
            \ 'f' : 'search {word}',
            \ 'c' : 'change colorscheme',
            \ 'w' : 'search cursorword',
            \ 'v' : 'search outline',
            \ },
      \ 'm' : 'open mundotree' ,
      \ 's' : 'save file',
      \ 'j' : 'open coc-explorer',
      \ 'st' : 'open startify screen',
      \ 'ep' : 'edit pluginsconfig {filename}',
      \ 'x' : 'coc cursors operate',
      \ 'g'  :{'name':'+git-operate',},
      \ 'c'    : {
              \ 'name' : '+coc list' ,
              \ 'a'    : 'coc CodeActionSelected',
              \ 'd'    : 'coc Diagnostics',
              \ 'c'    : 'coc Commands',
              \ 'e'    : 'coc Extensions',
              \ 'j'    : 'coc Next',
              \ 'k'    : 'coc Prev',
              \ 'o'    : 'coc OutLine',
              \ 'r'    : 'coc Resume',
              \ 'n'    : 'coc Rename',
              \ 's'    : 'coc Isymbols',
              \ 'g'    : 'coc Gitstatus',
              \ 'f'    : 'coc files',
              \ 'm'    : 'coc search word to multiple cursors',
              \ },
      \ 'q' : {
            \ 'name' : '+coc-quickfix',
            \ 'f' : 'coc fixcurrent',
            \ },
      \ }
let g:which_key_map[' '] = {
      \ 'name' : '+easymotion-jumpto-word ' ,
      \ 'b' : ['<plug>(easymotion-b)' , 'beginning of word backward'],
      \ 'f' : ['<plug>(easymotion-f)' , 'find {char} to the left'],
      \ 'w' : ['<plug>(easymotion-w)' , 'beginning of word forward'],
      \ }


let g:which_key_localmap ={
      \ 'name' : '+LocalLeaderKey',
      \ 'l'    : {'name': '+ Language Specific',},
      \ 'v'    : 'open vista show outline',
      \ 'r'    : 'quick run',
      \ 'g' : {
            \ 'name' : '+golang-toolkit',
            \ 'i'    : 'go impl',
            \ 'd'    : 'go describe',
            \ 'c'    : 'go callees',
            \ 'C'    : 'go callers',
            \ 's'    : 'go callstack',
            \ },
      \ 's':{'name': '+Sandwich'},
      \ 'd':{'name': '+denite',
      \      'm'    : 'toolkit Menu',
      \     },
      \ 'j': 'half pagedown',
      \ 'jj': 'pagedown',
      \ 'k': 'half pageup',
      \ 'kk': 'pageup',
      \ 'f': 'Format Selected',
      \ 'F': 'Format'
      \ }

let g:which_key_rsbgmap = {
      \ 'name' : '+RightSquarebrackets',
      \ 'a'    : 'ale nextwarp',
      \ 'c'    : 'coc nextdiagnostics',
      \ 'b'    : 'next buffer',
      \ 'g'    : 'coc gitnextchunk',
      \ ']'    : 'jump prefunction-golang',
      \ }


let g:which_key_lsbgmap = {
      \ 'name' : '+LeftSquarebrackets',
      \ 'a'    : 'ale prewarp',
      \ 'c'    : 'coc prediagnostics',
      \ 'b'    : 'pre buffer',
      \ 'g'    : 'coc gitprevchunk',
      \ '['    : 'jump nextfunction-golang',
      \ }

let s:current_colorscheme = get(g:,"colors_name","")
if  s:current_colorscheme == "base16-default-dark"
    highlight WhichKeySeperator guibg=NONE ctermbg=NONE guifg=#a1b56c ctermfg=02
endif
if  s:current_colorscheme == "nord"
    highlight WhichKeySeperator guibg=#81A1C1 ctermbg=NONE guifg=#4C566A ctermfg=02
endif
