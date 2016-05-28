let s:save_cpo = &cpo
set cpo&vim

function! markdown_pl#View(is_del,...)
    let s:fileName = expand('%:p:r') . '.html'
    if executable(g:markdown_pre_tool)
        if a:0 > 0 && executable('cat')
            silent exec '!cat ' . a:1 . ' > ' . s:fileName
        endif
        silent exec '!' . g:markdown_pl_home . '/bin/markdown.pl % >>  ' . s:fileName
        if a:0 > 1 && executable('cat')
            silent exec '!cat ' . a:2 . ' >> ' . s:fileName
        endif
        call system(g:markdown_pre_tool . ' file://' . s:fileName)
        if a:is_del
            call system('rm ' . s:fileName)
        endif
    else
        echohl WarningMsg | echom "you need install " .g:markdown_pre_tool .",or set g:markdown_pre_tool to other tool!" | echohl none
    endif
endf


let &cpo = s:save_cpo
unlet s:save_cpo
