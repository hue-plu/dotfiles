#!/bin/bash

# create symbolic link
ln -s {~/dotfiles/,~/}.tmux.conf
ln -s {~/dotfiles/,~/}.vimrc
ln -s {~/dotfiles/,~/}.zsh
ln -s {~/dotfiles/,~/}.zshrc
ln -s {~/dotfiles/,~/}.Xdefaults

mkdir -p $HOME/.cache/shell/
mkdir -p $HOME/.vim/bundle/{backup,swap}/
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
mkdir -p $HOME/local/{bin,src,gocode}/

# @for arch linux
# yaourt -S the_silver_searcher peco-git 
# /@for arch linux

# ctrlp matcher
# cd ~/.vim/bundle/cpsm/
# sudo pacman -S cmake boost
# ./install.sh
# go get github.com/mattn/files

