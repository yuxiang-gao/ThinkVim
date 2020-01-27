"Plugin key settings
if dein#tap('lightline.vim')
        call etc#util#source_file("layers/+ui/lightline/config.vim")
endif
if dein#tap('denite.nvim')
        nnoremap <silent><LocalLeader>dm :<C-u>Denite menu<CR>
        noremap zl :<C-u>call <SID>my_denite_outline(&filetype)<CR>
        noremap zL :<C-u>call <SID>my_denite_decls(&filetype)<CR>
        noremap zT :<C-u>call <SID>my_denite_file_rec_goroot()<CR>
        noremap <LocalLeader>db :<C-u>Denite buffer<CR>
        noremap <LocalLeader>df :<C-u>Denite file<CR>
        noremap <LocalLeader>dj :<C-u>Denite jump<CR>
        noremap <LocalLeader>dh :<C-u>Denite help<CR>
        noremap <LocalLeader>dl :<C-u>Denite line<CR>
        noremap <LocalLeader>ds :<C-u>Denite grep<CR>
        noremap <LocalLeader>dc :<C-u>Denite source<CR>
        noremap <LocalLeader>dt :<C-u>Denite tag<CR>
        noremap <LocalLeader>dC :<C-u>Denite command<CR>

        nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all<CR>
	    nnoremap <silent> <Leader>gh :<C-u>Denite gitbranch<CR>
        function! s:my_denite_outline(filetype) abort
        execute 'Denite' a:filetype ==# 'go' ? "decls:'%:p'" : 'outline'
        endfunction
        function! s:my_denite_decls(filetype) abort
        if a:filetype ==# 'go'
            Denite decls
        else
            call denite#util#print_error('decls does not support filetypes except go')
        endif
        endfunction
        function! s:my_denite_file_rec_goroot() abort
        if !executable('go')
            call denite#util#print_error('`go` executable not found')
            return
        endif
        let out = system('go env | grep ''^GOROOT='' | cut -d\" -f2')
        let goroot = substitute(out, '\n', '', '')
        call denite#start(
                \ [{'name': 'file/rec', 'args': [goroot]}],
                \ {'input': '.go'})
        endfunction
endif

if dein#tap('coc.nvim')
        " Using CocList*
        " Show all diagnostics
        nnoremap <silent> <leader>cb  :<C-u>CocList branches<cr>
        nnoremap <silent> <leader>cg  :<C-u>CocList gfiles<cr>
        nnoremap <silent> <leader>cy  :<C-u>CocList yank<cr>
        nnoremap <silent> <leader>cl  :<C-u>CocList lists<cr>
        nnoremap <silent> <leader>cf  :<C-u>CocList files<cr>
        nnoremap <silent> <leader>cd  :<C-u>CocList diagnostics<cr>
        " Manage extensions
        nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
        " Show commands
        nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
        " Find symbol of current document
        nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
        " Search workspace symbols
        nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
        " Do default action for next item.
        nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
        " Do default action for previous item.
        nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
        " Resume latest coc list
        nnoremap <silent> <leader>cr  :<C-u>CocListResume<CR>
        " Use `[c` and `]c` for navigate diagnostics
        nmap <silent> ]c <Plug>(coc-diagnostic-prev)
        nmap <silent> [c <Plug>(coc-diagnostic-next)
        " Remap for rename current word
        nmap <leader>cn <Plug>(coc-rename)
        " Remap for format selected region
        vmap <leader>cF  <Plug>(coc-format-selected)
        nmap <leader>cF  <Plug>(coc-format-selected)
        " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
        xmap <leader>ca  <Plug>(coc-codeaction-selected)
        nmap <leader>ca  <Plug>(coc-codeaction-selected)
        " Remap for do codeAction of current line
        nmap <leader>ac  <Plug>(coc-codeaction)
        " Fix autofix problem of current line
        nmap <leader>qf  <Plug>(coc-fix-current)
        " Remap keys for gotos
        nmap <silent> gd <Plug>(coc-definition)
        nmap <silent> gy <Plug>(coc-type-definition)
        nmap <silent> gi <Plug>(coc-implementation)
        nmap <silent> gr <Plug>(coc-references)
        " Use K for show documentation in float window
        nnoremap <silent> K :call CocActionAsync('doHover')<CR>
        " use <c-space> for trigger completion.
        inoremap <silent><expr> <c-space> coc#refresh()
        nmap [g <Plug>(coc-git-prevchunk)
        nmap ]g <Plug>(coc-git-nextchunk)
        " show chunk diff at current position
        nmap gs <Plug>(coc-git-chunkinfo)
        " show commit contains current position
        nmap gm <Plug>(coc-git-commit)
        nnoremap <silent> <leader>cg  :<C-u>CocList --normal gstatus<CR>
        " float window scroll
		nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
		nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
        " multiple cursors
        nmap <expr> <silent> <C-d> <SID>select_current_word()
        nmap <silent> <C-c> <Plug>(coc-cursors-position)
        nmap <silent> <C-s> <Plug>(coc-cursors-word)
        xmap <silent> <C-s> <Plug>(coc-cursors-range)
        " use normal command like `<leader>xi(`
        nmap <leader>x  <Plug>(coc-cursors-operator)
        " nmap <expr> <silent> <C-d> <SID>select_current_word()

        function! s:select_current_word()
            if !get(g:, 'coc_cursors_activated', 0)
                return "\<Plug>(coc-cursors-word)"
            endif
            return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
        endfunc

        nnoremap <silent> <leader>cm ::CocSearch -w 
        nnoremap <silent> <leader>cw ::CocSearch  
        " coc-explorer
        " noremap <silent> <leader>ja :execute 'CocCommand explorer' .
        "     \ ' --toggle' .
        "     \ ' --sources=buffer+,file+' .
        "     \ ' --file-columns=git,selection,icon,clip,indent,filename,size ' . expand('%:p:h')<CR>

        " nmap ge :CocCommand explorer<CR>
        " nmap gE :CocCommand explorer --position=right<CR>
        " execute "nmap <leader>r :CocCommand explorer --reveal=".expand('<sfile>:h')."/package.json<CR>"
        " nmap <leader>jt :CocCommand explorer --position=tab<CR>
        nmap <leader>j :CocCommand explorer --file-columns=git:selection:clip:diagnosticError:indent:icon:filename;fullpath;size;modified;readonly<CR><CR>
        " nmap <leader>cfb :CocCommand explorer --file-columns=git:selection:clip:diagnosticError:indent:icon:filename;fullpath;size;created;modified;accessed;readonly<CR>



        " terminal
         nnoremap <silent> <Leader>ct :CocCommand terminal.Toggle<CR>
        " Python
         autocmd FileType python nnoremap <silent> <LocalLeader>ll :CocCommand python.runLinting<CR>
         autocmd FileType python nnoremap <silent> <LocalLeader>lr :CocCommand python.execInTerminal<CR>
         autocmd FileType python nnoremap <silent> <LocalLeader>lt :CocCommand python.createTerminal<CR>
         " LaTex
         autocmd FileType tex nnoremap <silent> <LocalLeader>lb :CocCommand latex.Build<CR>
endif

if dein#tap('fzf.vim')
        nnoremap <silent> <leader>fc :Colors<CR>
        nnoremap <silent> <leader>fb :Buffers<CR>
        nnoremap <silent> <leader>fr :call Fzf_dev()<CR>
        nnoremap <silent> <leader>ff :Rg<CR>
        nnoremap <silent> <leader>fw :Rg <C-R><C-W><CR>
endif

if dein#tap('vim-easy-align')
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
endif

if dein#tap('tabular')
    " Hit Alt-Shift-A then type a character you want to align by
    nmap <leader>a :Tabularize /
    vmap <leader>a :Tabularize /
endif

if dein#tap('vim-go')
	 nnoremap <silent> <LocalLeader>gi :GoImpl<CR>
	 nnoremap <silent> <LocalLeader>gd :GoDescribe<CR>
	 nnoremap <silent> <LocalLeader>gc :GoCallees<CR>
	 nnoremap <silent> <LocalLeader>gC :GoCallers<CR>
	 nnoremap <silent> <LocalLeader>gs :GoCallstack<CR>
endif

" if dein#tap('vim-easygit')
" 	nnoremap <silent> <Leader>gd :Gdiff<CR>
"     nnoremap <silent> <Leader>ga :Gadd<space>
" 	nnoremap <silent> <Leader>gc :Gcommit<CR>
"     nnoremap <silent> <Leader>gp :Gpull<CR>
"     nnoremap <silent> <Leader>gP :Gpush<CR>
" 	nnoremap <silent> <Leader>gb :Gblame<CR>
" 	nnoremap <silent> <Leader>gB :Gbrowse<CR>
" 	nnoremap <silent> <Leader>gS :Gstatus<CR>
" 	" nnoremap <silent> <LocalLeader>gp :Gpush<CR>
" endif

if dein#tap('vim-fugitive')
	nnoremap <silent> <Leader>gd :Git diff<CR>
    nnoremap <silent> <Leader>ga :Git add<space>
	nnoremap <silent> <Leader>gc :Git commit<CR>
    nnoremap <silent> <Leader>gp :Git pull<CR>
    nnoremap <silent> <Leader>gP :Git push<CR>
	nnoremap <silent> <Leader>gb :Git blame<CR>
	nnoremap <silent> <Leader>gB :Git browse<CR>
    nnoremap <silent> <Leader>gS :Git stash<CR
	nnoremap <silent> <Leader>gs :Git status<CR>
endif

if dein#tap('chemzqm/denite-git')
    call denite#custom#map(
          \ 'normal',
          \ 'a',
          \ '<denite:do_action:add>',
          \ 'noremap'
          \)
    call denite#custom#map(
          \ 'normal',
          \ 'd',
          \ '<denite:do_action:delete>',
          \ 'noremap'
          \)
    call denite#custom#map(
          \ 'normal',
          \ 'r',
          \ '<denite:do_action:reset>',
          \ 'noremap'
          \)
    call denite#custom#map(
          \ 'normal',
          \ 'c,
          \ '<denite:do_action:commit>',
          \ 'noremap'
          \)
    call denite#custom#map(
          \ 'normal',
          \ 'C',
          \ '<denite:do_action:checkout>',
          \ 'noremap'
          \)
    call denite#custom#map(
          \ 'normal',
          \ 'b',
          \ '<denite:do_action:branch>',
          \ 'noremap'
          \)
endif

if dein#tap('magit.vim')
	nnoremap <silent> <Leader>gm :Magit<CR>
endif

if dein#tap('gina.vim')
	nnoremap <silent><Leader>gp :Gina push<CR>
endif

if dein#tap('vim-mundo')
    nnoremap <silent> <leader>m :MundoToggle<CR>
endif

if dein#tap('vim-choosewin')
	nmap -         <Plug>(choosewin)
	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('accelerated-jk')
	nmap <silent>j <Plug>(accelerated_jk_gj)
	nmap <silent>k <Plug>(accelerated_jk_gk)
endif

if dein#tap('caw.vim')
    function! InitCaw() abort
		if ! &l:modifiable
			silent! nunmap <buffer> gc
			silent! xunmap <buffer> gc
			silent! nunmap <buffer> gcc
			silent! xunmap <buffer> gcc
		else
			nmap <buffer> gc <Plug>(caw:prefix)
			xmap <buffer> gc <Plug>(caw:prefix)
			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
		endif
	endfunction
	autocmd FileType * call InitCaw()
	call InitCaw()
endif


if dein#tap('comfortable-motion.vim')
    nnoremap <silent> <LocalLeader>j :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
    nnoremap <silent> <LocalLeader>k :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
    nnoremap <silent> <LocalLeader>jj :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
    nnoremap <silent> <LocalLeader>kk :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
    noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
    noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
endif

if dein#tap('python_match.vim')
	nmap <buffer> {{ [%
	nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
	nnoremap <Leader>G :Goyo<CR>
endif

if dein#tap('defx.nvim')
        nnoremap <silent> <Leader>e
               \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
         nnoremap <silent> <Leader>F
				\ :<C-u>Defx -resume -toggle -search=`expand('%:p')` `getcwd()`<CR>
endif


if dein#tap('vim-startify')
    nnoremap <silent> <leader>st :Startify<CR>
endif

if dein#tap('vim-quickrun')
    nnoremap <silent> <LocalLeader>r :QuickRun<CR>
endif

if dein#tap('dash.vim')
        nnoremap <silent><leader>d :Dash<CR>
endif

if dein#tap('vim-expand-region')
        xmap v <Plug>(expand_region_expand)
        xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('splitjoin.vim')
        let g:splitjoin_join_mapping = ''
        let g:splitjoin_split_mapping = ''
        nmap sj :SplitjoinJoin<CR>
        nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('vista.vim')
        nnoremap <silent><LocalLeader>v :Vista!!<CR>
        nnoremap <silent><leader>fv     :Vista finder coc<CR>
endif

if dein#tap('ale')
        nmap [a <Plug>(ale_next_wrap)
        nmap ]a <Plug>(ale_previous_wrap)
endif

if dein#tap('vim-easymotion')
        nmap <Leader><Leader>w <Plug>(easymotion-w)
	    nmap <Leader><Leader>f <Plug>(easymotion-f)
	    nmap <Leader><Leader>b <Plug>(easymotion-b)
endif

if dein#tap('vim-which-key')
		nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
		nnoremap <silent> <LocalLeader> :<c-u>WhichKey  ';'<CR>
		nnoremap <silent>[              :<c-u>WhichKey  '['<CR>
		nnoremap <silent>]              :<c-u>WhichKey  ']'<CR>
endif

if dein#tap('vim-smartchr')
    inoremap <expr> , smartchr#one_of(',', ',')
    autocmd FileType go inoremap <buffer><expr> ;
            \ smartchr#loop(':=',';')
    autocmd FileType go inoremap <buffer> <expr> .
          \ smartchr#loop('.', '<-', '->','...')
endif

if dein#tap('vim-niceblock')
	xmap I  <Plug>(niceblock-I)
	xmap A  <Plug>(niceblock-A)
endif

if dein#tap('vim-sandwich')
     nmap <silent> <LocalLeader>sa <Plug>(operator-sandwich-add)
     xmap <silent> <LocalLeader>sa <Plug>(operator-sandwich-add)
     omap <silent> <LocalLeader>sa <Plug>(operator-sandwich-g@)
     nmap <silent> <LocalLeader>sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
     xmap <silent> <LocalLeader>sd <Plug>(operator-sandwich-delete)
     nmap <silent> <LocalLeader>sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
     xmap <silent> <LocalLeader>sr <Plug>(operator-sandwich-replace)
     nmap <silent> <LocalLeader>sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
     nmap <silent> <LocalLeader>srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
     omap ib <Plug>(textobj-sandwich-auto-i)
     xmap ib <Plug>(textobj-sandwich-auto-i)
     omap ab <Plug>(textobj-sandwich-auto-a)
     xmap ab <Plug>(textobj-sandwich-auto-a)
     omap is <Plug>(textobj-sandwich-query-i)
     xmap is <Plug>(textobj-sandwich-query-i)
     omap as <Plug>(textobj-sandwich-query-a)
     xmap as <Plug>(textobj-sandwich-query-a)
endif

if dein#tap('vim-operator-replace')
	xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-textobj-multiblock')
	omap <silent> ab <Plug>(textobj-multiblock-a)
	omap <silent> ib <Plug>(textobj-multiblock-i)
	xmap <silent> ab <Plug>(textobj-multiblock-a)
	xmap <silent> ib <Plug>(textobj-multiblock-i)
endif

" if dein#tap('iamcco/markdown-preview.nvim')
"     " example
"     nmap <LocalLeader>mp <Plug>MarkdownPreview
"     nmap <LocalLeader>ms <Plug>MarkdownPreviewStop
"     nmap <LocalLeader>md <Plug>MarkdownPreviewToggle
" endif
