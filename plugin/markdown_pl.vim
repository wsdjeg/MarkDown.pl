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
    call system('xdg-open file://'.s:fileName)
    call system('sleep 1')
    call system('rm '.s:fileName)
endf

let g:markdown_pl_loaded = 1

let &cpo = s:save_cpo
unlet s:save_cpo
