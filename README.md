# dotfiles

This repo contains a bunch of config files that help set up a familiar environment for applications such as [n]vim, bash, git, etc.

Vim:
* [vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* [tagbar](https://github.com/majutsushi/tagbar)
* [auto-pairs](https://github.com/jiangmiao/auto-pairs)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [cscope.vim](https://github.com/vim-scripts/cscope.vim)
* [coc](https://github.com/neoclide/coc.nvim)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [nerdtree](https://github.com/preservim/nerdtree)

NeoVim:
* [onedark.vim](https://github.com/joshdick/onedark.vim)
* [lightline.vim](https://github.com/itchyny/lightline.vim)
* [auto-pairs](https://github.com/jiangmiao/auto-pairs)
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
* [cscope.vim](https://github.com/vim-scripts/cscope.vim)
* [coc](https://github.com/neoclide/coc.nvim)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [nerdtree](https://github.com/preservim/nerdtree)
* [tagbar](https://github.com/preservim/tagbar)
* [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks)
* [lightline-bufferline](https://github.com/mengelbrecht/lightline-bufferline)

To use the configs:

Install `vim`/`nvim`, `git`, `curl`, `ctags`, `cscope` and `htop` if not already installed!

Quick setup:

```
git clone git@github.com:skrtbhtngr/dotfiles.git ~/.dotfiles
chmod +x ~/.dotfiles/setup_nvim.sh
~/.dotfiles/setup_nvim.sh
chmod +x ~/.dotfiles/setup_others.sh
~/.dotfiles/setup_others.sh
```

For [n]vim:

I have also included some comments which may help you in removing any option(s) you do not require.

If you wish to learn more about [n]vim options, refer: [Vim documentation: options](http://vimdoc.sourceforge.net/htmldoc/options.html), [Nvim documentation: options](https://neovim.io/doc/user/options.html)

*NOTE:* vim-gitgutter may cause a slowdown of your vim session if you are currently inside a git repo.

*NOTE:* Highlighting the cursor line may cause color issues as I have set the colors according to those of my iTerm profile (not vim).

Foreground: #FFFFFF

Background: #1E1E1E

Selection: #343434

Selected Text: #B2B2B2
