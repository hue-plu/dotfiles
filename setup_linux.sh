#!/bin/bash

# create symbolic link
ln -s {~/dotfiles/,~/}.tmux.conf
ln -s {~/dotfiles/,~/}.spacemacs
ln -s {~/dotfiles/,~/}.skk
ln -s {~/dotfiles/,~/}.zsh
ln -s {~/dotfiles/,~/}.zshrc
ln -s {~/dotfiles/,~/}.zshenv

# create local dirs
mkdir -p $HOME/.local/{src,bin,share}

# neovim config
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir  $XDG_CONFIG_HOME/nvim
ln -s ~/dotfiles/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
mkdir  $XDG_CONFIG_HOME/alacritty
ln -s ~/dotfiles/alacritty.yml $XDG_CONFIG_HOME/alacritty/alacritty.yml
# mkdir  $XDG_CONFIG_HOME/awesome
# ln -s ~/dotfiles/rc.lua $XDG_CONFIG_HOME/awesome/rc.rua

# tmux settings
sudo apt install cmake make gcc g++

cd $HOME/local/src
git clone https://github.com/thewtex/tmux-mem-cpu-load.git
cd tmux-mem-cpu-load
cmake .
make
sudo make install

# vim settings
if which git >/dev/null 2>&1; then
	mkdir -p $HOME/.local/share/{backup,swap,undo}
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
mkdir -p $HOME/.cache/shell/

# docker zsh completion
# https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker
