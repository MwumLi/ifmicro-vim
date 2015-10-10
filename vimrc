
" basics {
    set nocompatible
    " 定义快捷键的前缀 <Leader>
    let mapleader=";"
" }


" plugins {
    " 使用 Vundle 进行插件管理
    if filereadable(expand("~/.vimrc.plugins"))
	    source ~/.vimrc.plugins
    endif
" }

" custom {
    " vim 自身的一些特性设置(非插件)
    if filereadable(expand("~/.vimrc.custom"))
	    source ~/.vimrc.custom
    endif
" }

" funcs {
    " 利用 Vim 本身的特性以及插件的特性自定义函数
    if filereadable(expand("~/.vimrc.funcs"))
	    source ~/.vimrc.funcs
    endif
" }

" keys {
    " 所有的快捷键
    if filereadable(expand("~/.vimrc.keys"))
	    source ~/.vimrc.keys
    endif
" }

