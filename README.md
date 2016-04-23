# ifmicro-vim

## Quick install

    $ git clone -b light https://github.com/MwumLi/ifmicro-vim.git
    $ cd ifmicro_vim && make install 

## Quick update  

    $ make update
    
## 目标

轻快  
如果已经影响 vim 的速度, 那么这样的配置宁愿不用  

1. 一个配色看起来不错, 用起来顺手的编辑器  

## Todo

### v1.0

1. 主题支持 `solarized`, `molokai` 两款流行主题  
2. 解决粘贴是不自动缩进的问题 : `<F2>` 自由切换粘贴模式  
3. 一些自定义快捷键  


## Plugins

1. vim-airline  
   美化状态栏和标签页
   `]b` : 下一个标签页 
   `[b` : 上一下标签页

2. fecview  
   文件编码探测, 转换  
   设置 `g:ifmicro_encode_detect_enable` 为 1, 则开启自动编码探测
   `<Leader>u` : 转化编码为 utf-8, 并保存  

