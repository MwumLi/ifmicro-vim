# ifmicro_vim

Updated in 2015-11-13 by MwumLi

---

## Intrdocuce

`ifmicro_vim` is a distribution of vim plugins and resources for Vim, mostly ubuntu

At present, I only write it for visiting ubuntu 14.04 by xshell, not test the effects for other platform  

So I can't sure that whether it take effects for you in working platform.

But you can try it, don't worry it will  make a bad influence for you.

## Quick install

    $ git clone -b master https://github.com/MwumLi/ifmicro-vim.git
    $ cd ifmicro_code && make install 

update :  

    $ make update
    
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

**Note** : Please specify the following options before `.vimrc.plugins`  

1. Completion -- `g:ifmicro_ycm_enable`  

   The default is that the option doesn't be set, but the completion is `neocomplete`  

   If you need `YouCompleteMe` to completion, you must be :  

        let g:ifmicro_ycm_enable=1

   If you need `neocomplete` to completion, do nothing or set below :  

        let g:ifmicro_ycm_enable=0


2. Vim basic color tone -- `g:ifmicro_dark_color_tone_enable`  

   The default is that the option doesn't be set   

   The color tone is decided by your theme  

   If you need dark color tone, you must be :  

        let g:ifmicro_dark_color_tone_enable=1

   If you need dark color tone, you must be :  

        let g:ifmicro_dark_color_tone_enable=0

3. File Encoding Auto Detect -- `g:ifmicro_encode_detect_enable`  

   The default is `0`  

   If you need to open the file with the correct coding, you must be :  

        let g:ifmicro_encode_detect_enable=1

    If you would like to open file with vim encoding, you can :  

        let g:ifmicro_encode_detect_enable=0

4. Vim theme -- `g:ifmicro_theme`

   the default is `molokai`  

   other value :  

        "Tomorrow-Night-Bright"  
        "Tomorrow-Night"
        "Tomorrow-Night-Blue"
        "Tomorrow-Night-Eighties"
        "Tomorrow"
        "yowish"

   If you would like "Tomorrow", you must be :  

        let g:ifmicro_theme="Tomorrow"

5. NeoComplete.vim-Auto Choose -- `g:ifmicro_auto_compl_pop_enable`  

   The default doesn't enable auto choose   

   If you need auto choose item when completion occured, you muse be :  

        let g:ifmicro_auto_compl_pop_enable=1

   else   

        let g:ifmicro_auto_compl_pop_enable=0

