#!/bin/bash

# create symbolic link
ln -s {~/dotfiles/,~/}.tmux.conf
ln -s {~/dotfiles/,~/}.spacemacs
ln -s {~/dotfiles/,~/}.skk
ln -s {~/dotfiles/,~/}.zsh
ln -s {~/dotfiles/,~/}.zshrc
ln -s {~/dotfiles/,~/}.zshenv
# ln -s {~/dotfiles/,~/}.Xdefaults
ln -s {~/dotfiles/,~/}.pryrc

# before open Amethyst, remove under file
# rm  ~/Library/Preferences/com.amethyst.Amethyst.plist
ln -s {~/dotfiles/,~/}.amethyst

# create local dirs
mkdir -p $HOME/.local/{src,bin,share}

# neovim config
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir  $XDG_CONFIG_HOME/nvim
ln -s ~/dotfiles/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
mkdir  $XDG_CONFIG_HOME/alacritty
ln -s ~/dotfiles/alacritty.yml $XDG_CONFIG_HOME/alacritty/alacritty.yml
mkdir  $XDG_CONFIG_HOME/awesome
ln -s ~/dotfiles/rc.lua $XDG_CONFIG_HOME/awesome/rc.rua

# intelliJ
# ln -s {~/dotfiles/,~/}.ideavimrc

# vimfx config
ln -s ~/dotfiles/vimfx ~/.config/

# for osx
if [[ ! -e "`which cmake`" ]]; then
	echo "cmake command not found"
	exit 1
fi

# tmux settings
cd $HOME/local/src
git clone https://github.com/thewtex/tmux-mem-cpu-load.git
cd tmux-mem-cpu-load
cmake .
make
make install

cd $HOME

# vim settings
if which git >/dev/null 2>&1; then
	mkdir -p $HOME/.local/share/{backup,swap,undo}
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
mkdir -p $HOME/.cache/shell/

# for osx
if [[ ! -e "`which brew`" ]]; then
	echo "Homebrew is required: http://brew.sh"
	exit 1
fi

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions

brew update

brew cask install slate
ln -s {~/dotfiles/,~/}.slate.js

# install neovim
brew install neovim/neovim/neovim
brew install python
python3 -m pip install --user --upgrade pynvim
gem install neovim
gem install rcodetools
gem install fastri

# install spacemacs
brew tap d12frosted/emacs-plus
brew install emacs-plus --without-imagemagick
brew install cmigemo --HEAD
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
brew install ripgrep


# docker zsh completion
# https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker > ~/.zsh/completion/_docker

# alfred
brew cask install alfred
