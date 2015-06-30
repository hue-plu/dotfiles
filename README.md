# README #

## Settings
---

```shell
$dotfiles/setup.sh
```

*.zshenv (optional)*

```zsh
#!zsh
 path=(
        ~/local/bin
        $path
 )
```

## Vim configure 

```shell
./configure \
 --prefix=~/local\
 --enable-cscope\
 --enable-multibyte \
 --with-features=huge \
 --enable-luainterp \
 --with-lua-prefix=~/local \
 --with-luajit \
 --enable-perlinterp \
 --enable-pythoninterp \
 --with-python-config-dir=/usr/lib64/python2.6/config \
 --enable-rubyinterp \
 --with-ruby-command=/usr/bin/ruby \
 --enable-fail-if-missing \
 --enable-largefile
```

## Dependency

### lua-jit (vimproc)
brew install vim --withlua-jit
```
#!bash
 LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/local/lib
 export LD_LIBRARY_PATH

```
### ag
### peco
### cdr
zsh 4.3.11 ↑
### ctrlp.vim matcher (cpsm,files)
```shell
cd ~/.vim/bundle/cpsm/
sudo pacman -S cmake boost
./install.sh
go get github.com/mattn/files
```

---
## Optional
### for haskell
$cabal install ghc-mod

### wish-list
* wish-list
 
### reference
[ウィンドウ、タブのキーマップ](http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca)




