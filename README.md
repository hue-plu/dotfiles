# README #
## Settings
---
execute setup.sh
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
http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/

### peco

### cdr
zsh 4.3.11 ↑

---

### for haskell
.vim/ftplugin/haskell.vim 
setlocal omnifunc=necoghc#omnifunc
$cabal install happy

* wish-list
* tmuxinator 用xmlの自動生成ツール
