---
layout: default
---

## 最近一次更新  

2015-11-29 23:53:08  

## 简介  

`ifmicro-vim` 是一套可以快速部署并投入实用的 vim 配置, 包括了 Vim 的插件管理以及 Vim 自身的一些特性  

目前, 我仅仅在 Ubuntu 下进行了完整的测试并取得不错效果  

如果您对此感兴趣, 请放心尝试  
因为它会自动备份你原有配置  


## 快速安装  

    $ git clone -b master https://github.com/MwumLi/ifmicro-vim.git
    $ cd ifmicro_code && make install 

## 更新和安装

    $ cd ifmicro_code && make update

你可以订阅本项目, 一般项目有所更新, 会发邮件给您  
然后您可以使用上述命令进行更新安装  


## 项目结构及加载顺序  


(假如您需要做一些微调, 你可能需要关注这块)    

    .
    ├── colors      :   收集的一些配色方案
    ├── install.sh  :   安装脚本
    ├── Makefile    :   使用 make 来简化一些命令
    ├── README.md   
    ├── vimcdoc-1.9.0.tar.gz
    ├── vimrc           : 控制器, 控制其他配置文件的加载顺序
    ├── vimrc.custom    : vim 自身特性配置
    ├── vimrc.funcs     : 根据 vim 的自身和插件的特性自定义的函数
    ├── vimrc.keys      : 所有快捷键
    └── vimrc.plugins   : 使用 bundle 进行插件管理


`vimrc` 是控制器, 控制加载顺序  
它按顺序加载 `vimrc.plugins -> vimrc.custom -> vimrc-funcs -> vimrc-keys`  


## 选项

通过对选项的设置, 来控制这套配置的一些特性  

默认配置已经是一个不错的方案，如果你需要更好的控制, 那么你需要了解下面几个选项  

**建议** : 以下选项在 `vimrc` 中的 `global option` 里进行配置    

1. `g:ifmicro_ycm_enable` -- 启用 [ycm](https://github.com/Valloric/YouCompleteMe) 补全  
   提供两种补全插件 : `neocomplete` 和 `YouCompleteMe`  
   默认是没有启用此选项, 使用 `neocomplete` 进行补全    
   假如你需要使用 `YouCompleteMe`, 你需要设置 :  

        let g:ifmicro_ycm_enable=1

   同时按照[官网](https://github.com/Valloric/YouCompleteMe)编译 `ycm_support_libs`  

2. `g:ifmicro_dark_color_tone_enable` -- 启用 Vim 的暗色调
   Vim 有两种色调 :　亮色调和暗色调　　
   默认没有设置此选项, 即没有设置基础色调  
   不同的主题在不同的色调下表现并不一致  
   假如你需要暗色调, 你需要设置 :  

        let g:ifmicro_dark_color_tone_enable=1

   假如你需要亮色调, 你需要设置 :  

        let g:ifmicro_dark_color_tone_enable=0

3. `g:ifmicro_encode_detect_enable` -- 自动识别编码  
   默认并没有设置此选项,即默认采用 utf-8 打开  
   假如你希望以正确的编码打开文件, 你需要 :  

        let g:ifmicro_encode_detect_enable=1

4. `g:ifmicro_theme` -- Vim 主题  
   默认是 `molokai`  
   其他值 :  

        "Tomorrow-Night-Bright"  
        "Tomorrow-Night"
        "Tomorrow-Night-Blue"
        "Tomorrow-Night-Eighties"
        "Tomorrow"
        "yowish"

    假如你喜欢 "Tomorrow", 你需要 :  

        let g:ifmicro_theme="Tomorrow"

5. `g:ifmicro_auto_compl_pop_enable` -- 自动选中补全 item    
    默认是禁用 auto choose  
    假如你希望启用自动选中补全 item, 你需要 :  

        let g:ifmicro_auto_compl_pop_enable=1


## 快捷键和命令

1. 使用 map 定义的快捷键, 可通过 `:map ;wm` 类似的命令来查看  
2. 快捷键前缀 : `<Leader>` 默认为 `;`  

快捷键列表 :  

{% highlight vim %}
" 窗口关闭和保存 {
    qq          :   关闭当前窗口, 放弃修改  
    qw          :   关闭当前窗口, 如有修改未曾保存,底部会有提示阻止  
    qa          :   关闭所有窗口, 如有修改尚未保存,底部会有提示阻止  
    wq          :   保存内容并关闭当前窗口  
    <Leader>sw  :   强行保存当前窗口内容
    <Leader>sa  :   强行保存所有窗口内容
"}

" 窗口移动 {
    <Leader>lw 或 <C-W>l    :   跳转至右边的窗口
    <Leader>hw 或 <C-W>h    :   跳转至左边的窗口
    <Leader>kw 或 <C-W>k    :   跳转至上方的窗口
    <Leader>jw 或 <C-W>j    :   跳转至下方的窗口
"}

" 窗口分割 {
    :sp 或 :new     : 上下分割窗口
    :vsp 或 :vnew   : 左右分割窗口
"}

" 配置文件生效 {
    <Leader>sv 
"} 

" 移动 {
    1   :   跳到行首
    0   :   跳到行尾
    5   :   在匹配的括号间跳转
"}

" 切换 {
    <Leader>cr      :   切换行光标线  
    <Leader>cl      :   切换列光标线
    <Leader>n       :   切换行号
    <Leader>h       :   切换中英文帮助
    <Leader>ig      :   切换缩进可视化
}

" 插入当前时间 {
    'd  :   类似 2015-11-30 08:10:53
    输入 "date", 使用代码片段  
"}

" 映射系统剪贴板 {
    <Leader>y       :   可视化模式下, 选中某块区域, 按下此键, copy 内容到系统剪贴板  
    <Leader>p       :   粘贴系统剪贴板内容到当前缓冲区  
"}

" 缩进 {
    >       :   Visual 模式下, 选中行数, 按下此键向右移动 1 个缩进位  
    <       :   Visual 模式下, 选中行数, 按下此键向左移动 1 个缩进位
    >>      :   Normal 模式下, 按下此键, 向右移动 1 个缩进位
    <<      :   Normal 模式下, 按下此键, 向左移动 1 个缩进位
    :<<<    :   把当前行向左移动 3 个缩进位  
    :n1,n2> :   把 n1 到 n2 行向右移动 1 个缩进位
}

" 独立书签 {
    mx          :   添加和移动书签 'x' 在行号左边, 'x' is a-zA-Z
    m,          :   添加下一个可获得的书签  
    m.          :   假如当前没有书签, 添加下一个可获得书签
                    否则, 移除首个存在的标签  
    m-          :   删除当前行的所有书签
    m<Space>    :   删除当前缓冲区的所有书签
    m/          :   列出当前缓冲区的所有书签供你选择跳转
" }

" 注释 {
    <Leader>cc      :   注释当前行
    <Leader>cm      :   只用一组符号来注释
    <Leader>cy      :   注释并复制
    <Leader>cs      :   优美的注释
    <Leader>cu      :   取消注释
" }

" 逗比模式 {
    <Leader>di  : 开启逗比模式
    <Leader>ds  : 关闭逗比模式  
" }

" 补全 {
    <CR>            :   隐藏 popup 窗口, Insert 模式
    <Leader>;       :   ycm 使用 OmiCppComplete engine
    ArrowUp/<C-p>   :   向上选中 item
    ArrowDown       :   向下选中 item
}

" 扩展代码片段 {
    <TAB>           :  Insert 模式下, 补全 item 含有 `<snip>` 的片段, 可用此键进行扩展并跳到下一个占位符   
" }

" CtrlP -- 类 sublime 的 ctrlp 功能 {
    <C-p>           :   打开 CtrlP 面板    
    <F5>            :   清除当前目录下的缓存, 获取新的结构
    <C-f>/<C-b>     :   切换查找模式(所有文件->当前缓冲区文件->最近访问的文件)
    <C-d>           :   切换匹配模式(路径->文件名)
    <C-r>           :   切换正则匹配模式
    <C-k>/<C-j>     :   结果列表中向上/向下移动
    <C-p>/<C-n>     :   查找历史的上一项/下一项
    <C-y>           :   创造新文件
    <C-z>           :   mark/unmark multiple files and <C-o> to open them
    <C-o>           :   打开文件, 提示你选择何种展示方式  
"}

" syntastic -- 语义检查 {
    <Leader>er      : popup the  location-list and display the error messages
    <Leader>lc      : close location list window
    <Leader>sm      : 启用/关闭语义检查
"}

" NerdTree,taglist,tagbar {
    <Leader>wm      : 打开或关闭文件,标签管理窗口
    <Leader>tl      : 打开或关闭 TagList
    <Leader>tt      : 打开或关闭 TagBar
    <Leader>nt      : 打开或关闭 NerdTree
" }

" 标签页 {
    [b       : 下一个标签页
    ]b       : 上一个标签页
}

" markdwon {
    <Leader>m      : 打开 markdown 目录
}

" 编码 {
    <Leader>u   : 当用正确的编码打开后，执行这个快捷键，转化编码为utf-8,并保存
}

{% endhighlight %}

