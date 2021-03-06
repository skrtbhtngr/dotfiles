#!/bin/bash

mkdir -p "$HOME/.config/nvim"

ln -s "$HOME/.dotfiles/init.vim" "$HOME/.config/nvim/init.vim"
ln -s "$HOME/.dotfiles/c.vim" "$HOME/.config/nvim/syntax/c.vim"

cd "$HOME/.config/nvim/"

echo -e "Installing onedark...\n"
git clone https://github.com/joshdick/onedark.vim "$HOME/.config/nvim/onedark.vim"
cd onedark.vim
cp -r autoload colors ../

cd ../
echo -e "\nInstalling lightline...\n"
git clone https://github.com/itchyny/lightline.vim "$HOME/.config/nvim/lightline"
cd lightline
cp -r autoload doc plugin ../

cd ../
echo -e "\nInstalling auto-pairs...\n"
git clone https://github.com/jiangmiao/auto-pairs "$HOME/.config/nvim/auto-pairs"
cd auto-pairs
cp -r plugin ../

cd ../
echo -e "\nInstalling mkdx...\n"
git clone https://github.com/SidOfc/mkdx "$HOME/.config/nvim/mkdx"
cd mkdx
cp -r autoload after doc ftplugin ../

cd ../
echo -e "\nInstalling gitgutter...\n"
git clone https://github.com/airblade/vim-gitgutter "$HOME/.config/nvim/gitgutter"
cd gitgutter
cp -r autoload doc plugin ../

cd ../
echo -e "\nInstalling cscope...\n"
git clone https://github.com/vim-scripts/cscope.vim "$HOME/.config/nvim/cscope.vim"
cd cscope.vim
cp -r doc plugin ../

cd ../
echo -e "\nInstalling nerdtree...\n"
git clone https://github.com/preservim/nerdtree "$HOME/.config/nvim/nerdtree"
cd nerdtree
cp -r autoload doc lib nerdtree_plugin syntax ../

echo -e "\nDone!"
