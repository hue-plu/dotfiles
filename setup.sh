#!/bin/bash

# create symbolic link
ln -s {~/dotfiles/,~/}.tmux.conf
ln -s {~/dotfiles/,~/}.vimrc
ln -s {~/dotfiles/,~/}.emacs.d
ln -s {~/dotfiles/,~/}.zsh
ln -s {~/dotfiles/,~/}.zshrc
ln -s {~/dotfiles/,~/}.zshenv
ln -s {~/dotfiles/,~/}.Xdefaults
ln -s {~/dotfiles/,~/}.vimperatorrc

# create local dirs
mkdir -p $HOME/local/{src,bin}

# vim settings
if which git >/dev/null 2>&1; then
	mkdir -p $HOME/.vim/{backup,swap,bundle}
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

mkdir -p $HOME/.cache/shell/
