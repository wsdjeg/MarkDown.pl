#MarkDown.pl

将md文件转化为html
请将一下内容加入到vimrc

火狐浏览器

```vim
autocmd filetype markdown nmap md :!~/.vim/bundle/MarkDown.pl/markdown.pl % > %.html<cr><cr>
autocmd filetype markdown nmap fi :!firefox %.html & <CR><CR>
```

谷歌浏览器

```vim
autocmd filetype markdown nmap md :!~/.vim/bundle/MarkDown.pl/markdown.pl % > %.html<cr><cr>
autocmd filetype markdown nmap fi :!chrome %.html & <CR><CR>
```
