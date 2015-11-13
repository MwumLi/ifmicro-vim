#!/usr/bin/env bash

# all old configurations
backup_configs=('.vimrc' '.vim' '.vimrc.plugin' '.vimrc.custom' '.vimrc.funcs' '.vimrc.keys')
# all new configuration
vimrcs=("vimrc" "vimrc.plugins" "vimrc.custom" "vimrc.funcs" "vimrc.keys")
# vim user dirctory
vim_dir=("bundle" "colors" "autoload" "doc" "ftplugin" "syntax" "plugin" "vimrc_s")
cur_position=`pwd`
# the project path -- must be absolute path
# if the install.sh isn't project, you must specify a ifmicro_vim path
ifmicro_vim=`pwd`
# install path , the default is $HOME
root_dir="$HOME"

function msg() {
    printf '%b\n' "$1" >&2
}
function success() {
    
    msg_str="\33[32m[✔]\33[0m ${1}"

    if [ $# == 2 ]; then 
        msg_str="${msg_str} : ${2}"
    fi 

    msg "${msg_str}"
}

function error()
{
    msg_str="\33[31m[✘]\33[0m ${1}"

    if [ $# == 2 ]; then 
        msg_str="${msg_str} : ${2}"
    fi 

    msg "${msg_str}"
}

function print_curtime() {
    echo `date '+%F %r'`
    echo
}

# .vimrc .vim 
function backup() {
    
    length=${#backup_configs[*]}


    today=`date '+%Y%m%d_%s'`

    mkdir -vp "${root_dir}/vim.${today}" 1>>log.txt 2>>log.txt
    print_curtime >>log.txt

    msg "Attempting to back up your old vim configuration."
    for (( i = 0; i < ${length}; i++ )); do
        per_config="${root_dir}/${backup_configs[$i]}"

        if [ -e "${per_config}" ] && [ ! -L "${per_config}" ]; then 
        #if [ -e "${per_config}" ]; then 
            cp -Rfv "${per_config}" "${root_dir}/vim.${today}/"  1>>log.txt 2>>log.txt
             print_curtime >>log.txt

            if [ "$?" != "0" ]; then 
                error "${per_config} backup failed"
                error "exit and abort installation"
                exit 1
            fi
        else
            # path doesn't exist
            echo  "$original_file doesn't exist or is a link" 1>>log.txt 2>>log.txt
        fi
    done
    success "Your original vim configuration has been backed up." 

}

# backup
function config() {
 
    msg "start to create vim resource directories"
    length=${#vim_dir[*]}
    for (( i = 0; i < ${length}; i++ )); do
        mkdir -vp "${root_dir}/.vim/${vim_dir[$i]}" 1>>log.txt 2>>log.txt
        print_curtime >>log.txt
        if [ "$?" = "0" ]; then 
            success "${root_dir}/.vim/${vim_dir[$i]} created successfully"
        else 
            error "${root_dir}/.vim/${vim_dir[$i]} create failed"
            error "exit and abort the installation"
            exit 1
        fi
    done
    success "create vim resource successfully"

    msg "start to copy resource files" 
    cp -Rfv ${ifmicro_vim}/vimrc* ${root_dir}/.vim/vimrc_s/ 1>>log.txt 2>>log.txt 
    print_curtime >>log.txt
    if [ "$?" != "0" ]; then 
            error "copy failed"
            error "exit and abort the installation"
            exit 1
    else 
        success "copy resource file successfully"
    fi 

    msg "start to build links"
    length=${#vimrcs[*]}
    for (( i = 0; i < ${length}; i++ )); do
        ln -sfv "${root_dir}/.vim/vimrc_s/${vimrcs[$i]}" "${root_dir}/.${vimrcs[$i]}" 1>>log.txt 2>>log.txt
        print_curtime >>log.txt

        if [ "$?" != "0" ]; then 
            error "${root_dir}/${vimrcs[$i]} symolic link failed"
            error "exit and abort installation"
            exit 1
        fi
    done 
    success "build links successfully"



    # download Vundle for managing other vim plugins
    msg "satrt to download Vundle.vim"
    git clone https://github.com/gmarik/Vundle.vim.git ${root_dir}/.vim/bundle/Vundle.vim 1>>log.txt 2>>log.txt
    print_curtime >>log.txt
    if [ "$?" = "0" ]; then
        success "downloading Vundle.vim successfully"
    else
        error "Vundle failed" " Try to : git clone https://github.com/gmarik/Vundle.vim.git ${root_dir}/.vim/bundle/Vundle.vim"
    fi

    # build simplified Chinese help document
    msg "start to build simplified chinese help document"
    tar -xvf ${ifmicro_vim}/vimcdoc-1.9.0.tar.gz -C ${ifmicro_vim}/ 1>>log.txt 2>>log.txt
    print_curtime >>log.txt

    if [ "$?" = "0" ]; then 
        cd ${ifmicro_vim}/vimcdoc-1.9.0 && ./vimcdoc.sh -I 1>>log.txt 2>>log.txt
        if [ "$?" = "0" ] ; then    
            # delete simplifie chinese doc
            cd -
            rm -rv ${ifmicro_vim}/vimcdoc-1.9.0 1>>log.txt 2>>log.txt
            print_curtime >>log.txt

            success "Chinese-Vim-Doc is installed successfully!" "Try to ':help vim' in vim Normal mode"
        else
            error "Chines-Vim-Doc failed" "Try to download from github"
        fi
    else 
        error "Chines-Vim-Doc failed" "Try to download from github"
    fi


    # install colorscheme 
    msg "start to move colorscheme"
    cp -Rv ${ifmicro_vim}/colors/*  ${root_dir}/.vim/colors/ 1>>log.txt 2>>log.txt
    if [ "$?" = "0" ]; then
        success "Colorscheme is placed below ${root_dir}/.vim/colors successfully"
    else
        error "ColorScheme" "Try to search"
    fi
    
    vim +PluginInstall  +GoInstallBinaries +qall
}
cd ${ifmicro_vim}
msg "ifmicro_vim will be installed below  ${root_dir}"

backup
config

success "ifmicro_vim installed successfully"
msg     "Thanks for installing ifmicro_vim"
msg     "© `date +%Y` http://www.ifmicro.com/"
cd ${cur_position}
