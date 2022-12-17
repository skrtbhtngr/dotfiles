#!/bin/bash

NVIM_CONFIG_DIR="$HOME/.config/nvim"

mkdir -p "${NVIM_CONFIG_DIR}/syntax"
mkdir "${NVIM_CONFIG_DIR}/ftplugin"

ln -s "$HOME/.dotfiles/init.vim" "${NVIM_CONFIG_DIR}/init.vim"
ln -s "$HOME/.dotfiles/c_syntax.vim" "${NVIM_CONFIG_DIR}/syntax/c.vim"
ln -s "$HOME/.dotfiles/c_ftplugin.vim" "${NVIM_CONFIG_DIR}/ftplugin/c.vim"

# yarn installation needs a repo to be added; default apt repo soes not work as of now!
PLUGINS="
onedark     https://github.com/joshdick/onedark.vim     {autoload,colors}
lightline   https://github.com/itchyny/lightline.vim    {autoload,doc,plugin}
auto-pairs  https://github.com/jiangmiao/auto-pairs     plugin
mkdx        https://github.com/SidOfc/mkdx              {autoload,after,doc,ftplugin}
gitgutter   https://github.com/airblade/vim-gitgutter   {autoload,doc,plugin}
cscope      https://github.com/vim-scripts/cscope.vim   {doc,plugin}
nerdtree    https://github.com/preservim/nerdtree       {autoload,doc,lib,nerdtree_plugin,plugin}
coc         https://github.com/neoclide/coc.nvim.git    {autoload,bin,build,data,doc,lua,node_modules,plugin}
fugitive    https://github.com/tpope/vim-fugitive.git   {autoload,doc,ftdetect,ftplugin,plugin,syntax}
"
readarray -t <<< $PLUGINS

for (( pl = 1; pl < ${#MAPFILE[@]} - 1; pl++ ))
do
    PLD=(${MAPFILE[$pl]})
    PDIR=${NVIM_CONFIG_DIR}/${PLD[0]}
    echo -e "Installing ${PLD[0]}..."
    git -C ${PDIR} pull --rebase || git clone ${PLD[1]} ${PDIR}
    if [[ $? != 0 ]]; then
        exit -1
    fi
    if [[ ${PLD[0]} == "coc" ]]; then
        (cd ${PDIR}; yarn install)
    fi
    eval "cp -rf ${PDIR}/${PLD[2]} ${NVIM_CONFIG_DIR}/"
done

echo -e "\nDone!"
