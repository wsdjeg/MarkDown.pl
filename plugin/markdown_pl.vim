command! -nargs=0 MarkDownPreview call MarkDownPreview()

function MarkDownPreview()
    let s:fileName = expand(%:r)
    silent exec '!~/.vim/bundle/MarkDown.pl/markdown.pl % >  '.s:fileName.'.html'
    exec '!firefox '.s:fileName.'.html'
endf

