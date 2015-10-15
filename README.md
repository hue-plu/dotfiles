# README #
## Settings
https://gist.github.com/hue-plu/e7e303feb2a16de3a944#file-arch-linux
---
```shell
pacman -Syy
pacman -S the_silver_searcher tmux git vim wget mlocate zsh
yaourt -S peco
$dotfiles/setup.sh
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
 
### 参考
[ウィンドウ、タブのキーマップ](http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca)




