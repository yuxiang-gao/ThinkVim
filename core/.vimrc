if &compatible
	" vint: -ProhibitSetNoCompatible
	set nocompatible
	" vint: +ProhibitSetNoCompatible
endif

" Set main configuration directory as parent directory
let $VIM_PATH =
	\ get(g:, 'etc#vim_path',
	\   exists('*stdpath') ? stdpath('config') :
	\   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC), ':h') :
	\   ! empty($VIMCONFIG) ? expand($VIMCONFIG) :
	\   ! empty($VIM_PATH) ? expand($VIM_PATH) :
	\   fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
	\ )
let s:user_settings_path = expand('~/.thinkvim.d/local_settings.vim')

" Regular Vim doesn't add custom configuration directories, if you use one
if &runtimepath !~# $VIM_PATH
	set runtimepath^=$VIM_PATH
endif

let $DATA_PATH = g:etc#cache_path


augroup MyAutoCmd
	autocmd!
	autocmd CursorHold *? syntax sync minlines=300
augroup END

" Disable vim distribution plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:netrw_nogx = 1 " disable netrw's gx mapping.
let g:loaded_rrhelper = 1  " ?
let g:loaded_shada_plugin = 1  " ?
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

" Initialize base requirements
if has('vim_starting')
	" Global Mappings "{{{
	" Use spacebar as leader and ; as secondary-leader
	" Required before loading plugins!
	let g:mapleader="\<Space>"
	let g:maplocalleader=';'

	" Release keymappings prefixes, evict entirely for use of plug-ins.
	nnoremap <Space>  <Nop>
	xnoremap <Space>  <Nop>
	nnoremap ,        <Nop>
	xnoremap ,        <Nop>
	nnoremap ;        <Nop>
	xnoremap ;        <Nop>

   if ! has('nvim') && has('pythonx')
		if has('python3')
			set pyxversion=3
		elseif has('python')
			set pyxversion=2
		endif
	endif


	" Ensure data directories
	call etc#util#ensure_directory([
		\   g:etc#cache_path . '/undo',
		\   g:etc#cache_path . '/backup',
		\   g:etc#cache_path . '/session',
		\   g:etc#vim_path . '/spell'
		\ ])

endif

call etc#init()
call etc#util#source_file('layers/+thinkvim/config.vim')
let uname = system("uname -s")
if uname[:4] ==? "linux"
call etc#util#source_file('layers/+before/ubuntu-specific.vim')
endif

if uname[:4] !=? "linux"
call etc#util#source_file('layers/+before/mac-specific.vim')
endif

call etc#util#source_file('core/general.vim')
call etc#util#source_file('core/filetype.vim')
call etc#util#source_file('core/mappings.vim')


function! s:check_custom_settings(filename)abort
       let  content = readfile(a:filename)
       if empty(content)
           return 0
       endif
       return 1
endfunction

function! s:source_custom(path, ...) abort
  let use_global = get(a:000, 0, !has('vim_starting'))
  let abspath = resolve(expand('~/.thinkvim.d' . a:path))
  if !use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  " substitute all 'set' to 'setglobal'
  let content = map(readfile(abspath),
        \ 'substitute(v:val, "^\\W*\\zsset\\ze\\W", "setglobal", "")')
  " create tempfile and source the tempfile
  let tempfile = tempname()
  try
    call writefile(content, tempfile)
    execute 'source' fnameescape(tempfile)
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction
" Load user custom local settings
if filereadable(s:user_settings_path)
	if s:check_custom_settings(s:user_settings_path)
		call s:source_custom('/local_settings.vim')
	endif
endif

" Initialize user favorite colorscheme
call theme#init()
" call etc#util#source_file('core/color.vim')
colorscheme gruvbox9

set secure

" vim: set ts=2 sw=2 tw=80 noet :
