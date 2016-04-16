" options {

    " version
    let g:ifmicro_version = "v0.1"

    " 定义快捷键的前缀 <Leader>
    let g:ifmicro_leader = ";"

    "  vimrc 配置文件
    " 'prefix' ：配置文件路径前缀
    " 'order'  : 
    "       每一项的值对应一个配置文件, 也是当前 map 中的 key
    "       order 中的顺序就是配置文件加载顺序
    " 'ifmicro_vimrc_map[order[index]]' :
    "       'isLoad' : 当前配置文件是否加载
    "       'suffix' : 当前配置文件的后缀
    let g:ifmicro_vimrc_map = {  
                \"prefix" : "~/.vimrc.",
                \"order"  : ["0", "1", "2", "3", "4", "5"],
                \ "0" : { "isLoad": 1, "suffix": "plugins"},
                \ "1" : { "isLoad": 1, "suffix": "plugins.config"},
                \ "2" : { "isLoad": 1, "suffix": "theme"},
                \ "3" : { "isLoad": 1, "suffix": "custom"},
                \ "4" : { "isLoad": 1, "suffix": "funcs"},
                \ "5" : { "isLoad": 1, "suffix": "keys"}
                \ }

    " specify theme : solarized or no theme(default)
    let g:ifmicro_theme = "solarized"   
    " specify the way to teriminal : xshell or ubuntu desktop teriminal(default)
    let g:ifmicro_connect_term_way = "xshell"
    " specify the color tune in theme `solatized`
    " light or dark(default)
    let g:ifmicro_solarized_color_tune = "dark"
" }

" *********************** Modify the content before the follwoing line***************************"

" Basics {
    " 不使用 vi 兼容模式
     set nocompatible
     " 定义快捷键的前缀 <Leader>
     " 默认是 '\'  
     " 但更多人喜欢用 ',' 或 ';'
     " 在 vimrc.before 中通过 g:ifmcro_leader 来改变
     if !exists("g:ifmicro_leader")
        let mapleader = ";"
     else
        let mapleader = g:ifmicro_leader
     endif
" }


" load vimrc in vimrc_map {
    if !exists("g:ifmicro_vimrc_map")

        echo "g:ifmicro_vimrc_map not set "
        echo "maybe some function cann't achieved"

    else

        for key in ifmicro_vimrc_map["order"]

            if has_key(ifmicro_vimrc_map, key) && has_key(ifmicro_vimrc_map[key], "isLoad") && ifmicro_vimrc_map[key]['isLoad']

                let s:file = ifmicro_vimrc_map['prefix'] . ifmicro_vimrc_map[key]['suffix']
                if filereadable(expand(s:file))

                    execute "source " . s:file

                endif
            endif
        endfor 
    endif
" }


" version  {

    function GetIfmicroVersion()
        return "v1.0"
    endfunction
" }

"
