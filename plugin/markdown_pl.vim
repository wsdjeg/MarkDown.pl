command! -nargs=0 MarkDownPreview call MarkDownPreview()

function! MarkDownPreview()
    let s:fileName = expand("%:p:r")
    silent exec '!~/.vim/bundle/MarkDown.pl/markdown.pl % >  '.s:fileName.'.html'
    exec '!xdg-open file://'.s:fileName.'.html'
endf
