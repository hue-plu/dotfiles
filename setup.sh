#!/bin/bash

# create symbolic link
ln -s {~/dotfiles/,~/}.tmux.conf
ln -s {~/dotfiles/,~/}.zsh
ln -s {~/dotfiles/,~/}.zshrc
ln -s {~/dotfiles/,~/}.zshenv
ln -s ~/dotfiles/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/dotfiles/settings.json ~/Library/Application\ Support/Code/User/settings.json 

# create local dirs
mkdir -p $HOME/.local/{src,bin,share}

# neovim config
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir  $XDG_CONFIG_HOME/nvim
ln -s ~/dotfiles/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
mkdir  $XDG_CONFIG_HOME/alacritty
ln -s ~/dotfiles/alacritty.toml $XDG_CONFIG_HOME/alacritty/alacritty.toml
mkdir  $XDG_CONFIG_HOME/sheldon
ln -s ~/dotfiles/plugins.toml $XDG_CONFIG_HOME/sheldon/plugins.toml
mkdir  $XDG_CONFIG_HOME/karabiner
ln -s ~/dotfiles/karabiner.json $XDG_CONFIG_HOME/karabiner/karabiner.json

# vim settings
if which git >/dev/null 2>&1; then
	mkdir -p $HOME/.local/share/{backup,swap,undo}
    curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs \
    https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
fi
mkdir -p $HOME/.cache/shell/

# for osx
if [[ ! -e "`which brew`" ]]; then
	echo "Homebrew is required: http://brew.sh"
	exit 1
fi

brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions

brew update

# install neovim
brew install neovim/neovim/neovim
brew install python
python3 -m pip install --user --upgrade pynvim
gem install neovim
gem install rcodetools
gem install fastri

brew install ripgrep

# fzf
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# sheldon
brew install sheldon

# tmux
brew install tmux

