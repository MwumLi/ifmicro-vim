# ifmicro_vim

Updated in 2015-10-10 by MwumLi

---

## Intrdocuce

`ifmicro_vim` is a distribution of vim plugins and resources for Vim, mostly ubuntu

At present, I only write it for visiting ubuntu 14.04 by xshell, not test the effects for other platform  

So I can't sure that whether it take effects for you in working platform.

But you can try it, don't worry it will  make a bad influence for you.

## Quick install

    $ git clone -b master https://github.com/MwumLi/ifmicro-vim.git
    $ cd ifmicro_code && bash ./install.sh
    
## Load order

`.vimrc` is a controller, which control load order  
It load `.vimrc-plugins -> .vimrc-custom -> .vimrc-funcs -> .vimrc-keys` in order

1. `.vimrc.plugins`  
vim plugins and them configuration, key maps  

2. `.vimrc.custom`  
vim's configuration , not belong plugins  

3. `.vimrc.funcs`  
define some  function by vim and it's plugins feature

4. `.vimrc.keys`  
all key maps , including apperance before vimrc*

## Options

1. `g:ifmicro_ycm_enable`  

if you need YouCompleteMe to completion, you must be :  

        let g:ifmicro_ycm_enable=1


2. `g:ifmicro_dark_color_tone_enable`  

if you need dark color tone, you must be :  

        let g:ifmicro_dark_color_tone_enable=1

3. `g:g:ifmicro_encode_detect_enable`  

If you need to open the file with the correct coding, you must be :  

        let g:ifmicro_encode_detect_enable=1


