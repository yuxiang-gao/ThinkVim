" Markdown
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType markdown set spell
" autocmd FileType markdown map <silent> <leader>m :call TerminalPreviewMarkdown()<CR>o

let g:markdown_fenced_languages = [
    \ 'html',
    \ 'bash=sh',
    \ 'css',
    \ 'javascript',
    \ 'jsx=javascriptreact',
    \ 'tsx=typescriptreact',
    \ 'go',
    \ 'python'
    \]
