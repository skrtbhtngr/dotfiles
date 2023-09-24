#!/bin/bash

#TODO: verify this config

VIM_PLUGIN_DIR="~/.vim/pack/plugins/start"
mkdir -p VIM_PLUGIN_DIR

ln -s ~/.dotfiles/.vimrc ~/.vimrc

PLUGINS="
vim-airline https://github.com/vim-airline/vim-airline
vim-airline-themes  https://github.com/vim-airline/vim-airline-themes
tagbar      https://github.com/preservim/tagbar
auto-pairs  https://github.com/jiangmiao/auto-pairs
gitgutter   https://github.com/airblade/vim-gitgutter
cscope      https://github.com/vim-scripts/cscope.vim
coc         https://github.com/neoclide/coc.nvim
fugitive    https://github.com/tpope/vim-fugitive
nerdtree    https://github.com/preservim/nerdtree
"
readarray -t <<< $PLUGINS

for (( pl = 1; pl < ${#MAPFILE[@]} - 1; pl++ ))
do
    PLD=(${MAPFILE[$pl]})
    PDIR=${NVIM_PLUGIN_DIR}/${PLD[0]}
    echo -e "Installing ${PLD[0]}..."
    git -C ${PDIR} pull --rebase 2> /dev/null || git clone ${PLD[1]} ${PDIR}
    if [[ $? != 0 ]]; then
        exit -1
    fi
    if [[ ${PLD[0]} == "coc" ]]; then
        (cd ${PDIR}; yarn install)
    fi
done

echo -e "\nDone!"
