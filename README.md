#MarkDown.pl
将md文件转化为html
autocmd Syntax md nmap md :!~/.vim/bundle/markdown.pl/markdown.pl % > %.html <CR><CR>
autocmd Syntax md nmap fi :!firefox %.html & <CR><CR>
