#!/bin/bash

# create symbolic link
ln -s {~/dotfiles/,~/}.tmux.conf
ln -s {~/dotfiles/,~/}.emacs.d
ln -s {~/dotfiles/,~/}.zsh
ln -s {~/dotfiles/,~/}.zshrc
ln -s {~/dotfiles/,~/}.zshenv
ln -s {~/dotfiles/,~/}.Xdefaults
ln -s {~/dotfiles/,~/}.pryrc

# create local dirs
mkdir -p $HOME/.local/{src,bin,share}

# neovim config
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/dotfiles/.vimrc $XDG_CONFIG_HOME/nvim/init.vim

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

brew cask install karabiner

mkdir -p "$HOME/Library/Application Support/Karabiner"
cat ./private.xml > "$HOME/Library/Application Support/Karabiner/private.xml"

KARABINER="/Applications/Karabiner.app/Contents/Library/bin/karabiner"
if [[ -e "$KARABINER" ]]; then
	$KARABINER reloadxml
	$KARABINER set parameter.keyoverlaidmodifier_timeout 300
	$KARABINER set private.vim_keybind_apps_esc_with_eisuu
	$KARABINER set private.change_mission_control_display_with_uiojkl_keys
	$KARABINER set private.change_danish_dollar_to_backquote
	$KARABINER set repeat.initial_wait 300
	$KARABINER set repeat.wait 40
else
	echo "==> Warning: Karabiner.app not found < https://pqrs.org/osx/karabiner/index.html.en >"
fi

brew cask install slate
cat ./.slate.js > "~/.slate.js"

# install neovim
brew install neovim/neovim/neovim
brew install python3
gem install neovim
gem install rcodetools
gem install fastri
