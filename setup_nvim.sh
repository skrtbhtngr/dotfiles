#!/bin/bash

mkdir -p ~/.config/nvim

ln -s ~/.dotfiles/init.vim ~/.config/nvim/init.vim

cd ~/.config/nvim/

echo -e "Installing onedark...\n"
git clone https://github.com/joshdick/onedark.vim ~/.config/nvim/onedark.vim
cd onedark.vim
cp -r autoload colors ../

cd ../
echo -e "\nInstalling lightline...\n"
git clone https://github.com/itchyny/lightline.vim ~/.config/nvim/lightline
cd lightline
cp -r autoload doc plugin ../

cd ../
echo -e "\nInstalling auto-pairs...\n"
git clone https://github.com/jiangmiao/auto-pairs ~/.config/nvim/auto-pairs
cd auto-pairs
cp -r plugin ../

cd ../
echo -e "\nInstalling mkdx...\n"
git clone https://github.com/SidOfc/mkdx ~/.config/nvim/mkdx
cd mkdx
cp -r autoload after doc ftplugin ../

cd ../
echo -e "\nInstalling gitgutter...\n"
git clone https://github.com/airblade/vim-gitgutter ~/.config/nvim/gitgutter
cd gitgutter
cp -r autoload doc plugin ../

echo -e "\nDone!"
