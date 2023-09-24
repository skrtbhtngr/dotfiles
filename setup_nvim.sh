#!/bin/bash

NVIM_CONFIG_DIR="$HOME/.config/nvim"
mkdir -p $NVIM_CONFIG_DIR
ln -s "$HOME/.dotfiles/init.vim" "${NVIM_CONFIG_DIR}/init.vim"

NVIM_PLUGIN_DIR="$HOME/.local/share/nvim/site/pack/plugins/start"
mkdir -p $NVIM_PLUGIN_DIR

mkdir -p "$NVIM_CONFIG_DIR/syntax"
mkdir -p "$NVIM_CONFIG_DIR/ftplugin"
ln -s "$HOME/.dotfiles/c_syntax.vim" "$NVIM_CONFIG_DIR/syntax/c.vim"
ln -s "$HOME/.dotfiles/c_ftplugin.vim" "$NVIM_CONFIG_DIR/ftplugin/c.vim"

# need nodejs and yarn packages
# yarn installation needs a repo to be added; default apt repo does not work as of now!
PLUGINS="
onedark     https://github.com/joshdick/onedark.vim
lightline   https://github.com/itchyny/lightline.vim
auto-pairs  https://github.com/jiangmiao/auto-pairs
gitgutter   https://github.com/airblade/vim-gitgutter
cscope      https://github.com/vim-scripts/cscope.vim
coc         https://github.com/neoclide/coc.nvim
fugitive    https://github.com/tpope/vim-fugitive
nerdtree    https://github.com/preservim/nerdtree
tagbar      https://github.com/preservim/tagbar
vim-bookmarks   https://github.com/MattesGroeger/vim-bookmarks
lightline-bufferline    https://github.com/mengelbrecht/lightline-bufferline
"
readarray -t <<< $PLUGINS

for (( pl = 1; pl < ${#MAPFILE[@]} - 1; pl++ ))
do
    PLD=(${MAPFILE[$pl]})
    PDIR=${NVIM_PLUGIN_DIR}/${PLD[0]}
    echo -e "Installing ${PLD[0]}..."
    git -C ${PDIR} pull --rebase || git clone ${PLD[1]} ${PDIR}
    if [[ $? != 0 ]]; then
        exit -1
    fi
    if [[ ${PLD[0]} == "coc" ]]; then
        (cd ${PDIR}; yarn install)
    fi
done

echo -e "\nDone!"
