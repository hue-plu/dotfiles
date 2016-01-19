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
ln -s {~/dotfiles/,~/}.amethyst

# create local dirs
mkdir -p $HOME/local/{src,bin}

# vim settings
if which git >/dev/null 2>&1; then
	mkdir -p $HOME/.vim/{backup,swap,bundle,undo}
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
mkdir -p $HOME/.cache/shell/

if [[ ! -e "`which brew`" ]]; then
	echo "Homebrew is required: http://brew.sh"
	exit 1
fi

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

brew update

brew cask install amethyst

