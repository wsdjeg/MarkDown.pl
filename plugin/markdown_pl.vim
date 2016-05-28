let s:save_cpo = &cpo
set cpo&vim

if exists('g:markdown_pl_loaded')
    finish
endif

let g:markdown_pl_home = fnamemodify(expand('<sfile>'), ':p:h:h:gs?\\?/?')
let g:markdown_pre_tool = get(g:, 'markdown_pre_tool', 'firefox')

command! -nargs=* -complete=file -bang MarkDownPreview call markdown_pl#View('!' != '<bang>',<f-args>)


let g:markdown_pl_loaded = 1

let &cpo = s:save_cpo
unlet s:save_cpo
