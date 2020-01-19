" insert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-x> <BS>
inoremap <C-d> <Del>
inoremap <C-k>  <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
" inoremap <C-b> <Left>
" inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"
" vim style navigation in insert
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" command line alias
"cnoremap w!! w !sudo tee % >/dev/null
cnoremap <C-p> <Up>
" cnoremap <C-b> <Left>
" cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-x> <BS>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>
" vim style navigation in command
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>


" Write buffer (save)
noremap <Leader>s :w<CR>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

"insert a newline
inoremap <C-O> <Esc>o

" "switch windw
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v
nmap <leader>wrh :vertical resize -3<CR>
nmap <leader>wrl :vertical resize +3<CR>
nmap <leader>wrk :resize -3<CR>
nmap <leader>wrj :resize +3<CR>
" map <silent> <C-h> <Plug>WinMoveLeft
" map <silent> <C-j> <Plug>WinMoveDown
" map <silent> <C-k> <Plug>WinMoveUp
" map <silent> <C-l> <Plug>WinMoveRight
" settings for resize splitted window
nmap <C-w>[ :vertical resize -3<CR>
nmap <C-w>] :vertical resize +3<CR>

" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> <leader>qc :cclose<CR>
nmap <silent> <leader>qo :copen<CR>

"smart move
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"tabline operation
noremap <leader>tn :tabnew<cr>
noremap <leader>te :tabedit
noremap <leader>tm :tabmove
noremap <leader>td :tabclose<CR>
noremap <leader>tl :tabnext<CR>
noremap <leader>th :tabprev<CR>

"buffer
nnoremap <leader>bc :BufOnly<CR>
nnoremap <Leader>bo :BufOnly 
nnoremap  ]b :bp<CR>
nnoremap  [b :bn<CR>
"delete buffer
nnoremap <C-x>  :bd<CR>
nnoremap  ]b :bp<CR>
nnoremap  [b :bn<CR>
nnoremap <leader>bd  :bd<CR>
nnoremap <leader>bh :bp<CR>
nnoremap <leader>bl :bn<CR>

"yank to end
nnoremap Y y$

" Remove spaces at the end of lines
nnoremap <silent> ,<Space> :<C-u>silent! keeppatterns %substitute/\s\+$//e<CR>

" a command which  edit PLugin config easy
nnoremap <leader>ep :EditPluginSetting <Space>

nmap <leader>w1 <Plug>BuffetSwitch(1)
nmap <leader>w2 <Plug>BuffetSwitch(2)
nmap <leader>w3 <Plug>BuffetSwitch(3)
nmap <leader>w4 <Plug>BuffetSwitch(4)
nmap <leader>w5 <Plug>BuffetSwitch(5)
nmap <leader>w6 <Plug>BuffetSwitch(6)
nmap <leader>w7 <Plug>BuffetSwitch(7)
nmap <leader>w8 <Plug>BuffetSwitch(8)
nmap <leader>w9 <Plug>BuffetSwitch(9)
nmap <leader>w0 <Plug>BuffetSwitch(10)

nmap <leader>wq :wincmd q<cr>
nmap <leader>wqa :wincmd qa<cr>

nmap <leader>pz <Plug>Zoom

" Improve scroll, credits: https://github.com/Shougo
" nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
" 	\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
" noremap <expr> <C-f> max([winheight(0) - 2, 1])
" 	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
" noremap <expr> <C-b> max([winheight(0) - 2, 1])
" 	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
" noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
" noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")
