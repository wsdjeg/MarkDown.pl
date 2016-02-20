let s:save_cpo = &cpo
set cpo&vim

if exists('g:markdown_pl_loaded')
    finish
endif

let g:markdown_pl_home = fnamemodify(expand('<sfile>'), ':p:h:h:gs?\\?/?')

command! -nargs=0 MarkDownPreview call MarkDownPreview()

function! MarkDownPreview()
    let s:fileName = expand("%:p:r").'.html'
    silent exec '!'.g:markdown_pl_home.'/bin/markdown.pl % >  '.s:fileName
    exec '!xdg-open file://'.s:fileName
    echon "\r\r"
    echon ''
endf

let g:markdown_pl_loaded = 1

let &cpo = s:save_cpo
unlet s:save_cpo
