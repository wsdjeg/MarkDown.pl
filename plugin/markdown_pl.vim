let s:save_cpo = &cpo
set cpo&vim

if exists('g:markdown_pl_loaded')
    finish
endif

let g:markdown_pl_home = fnamemodify(expand('<sfile>'), ':p:h:h:gs?\\?/?')
let g:markdown_pre_tool = get(g:, 'markdown_pre_tool', 'firefox')

command! -nargs=0 -bang MarkDownPreview call MarkDownPreview('!' != '<bang>')

function! MarkDownPreview(is_del)
    let s:fileName = expand('%:p:r') . '.html'
    if executable(g:markdown_pre_tool)
        silent exec '!' . g:markdown_pl_home . '/bin/markdown.pl % >  ' . s:fileName
        call system(g:markdown_pre_tool . ' file://' . s:fileName)
        if a:is_del
            call system('rm ' . s:fileName)
        endif
    else
        echohl WarningMsg | echom "you need install " .g:markdown_pre_tool .",or set g:markdown_pre_tool to other tool!" | echohl none
    endif
endf

let g:markdown_pl_loaded = 1

let &cpo = s:save_cpo
unlet s:save_cpo
