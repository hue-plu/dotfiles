# README #
* wish-list
* tmuxinator 用xmlの自動生成ツール


alias settings



```
#!bash
ln -s ~/rcfiles/.vimrc ~/.vimrc
ln -s ~/rcfiles/.zsh ~/.zsh
ln -s ~/rcfiles/.zshenv ~/.zshenv
ln -s ~/rcfiles/.zshrc ~/.zshrc

wget https://github.com/peco/peco/releases/download/v0.2.10/peco_linux_386.tar.gz
tar xzvf peco_linux_386.tar.gz
```

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


use command

lua-jit (vimproc)
brew install vim --withlua-jit



```
#!bash
 LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/local/lib
 export LD_LIBRARY_PATH

```




ag
http://blog.glidenote.com/blog/2013/02/28/the-silver-searcher-better-than-ack/


percol
autojump



http://blog.zoncoen.net/blog/2014/01/14/percol-autojump-with-zsh/



.zshenv example

```
#!zsh
 path=(
        ~/local/bin
        $path
 )


```
use tmuxinator



need ruby version update and install tmuxinator
http://tactosh.com/2014/01/tmux-window-pane-tmuxinator/

for haskell
.vim/ftplugin/haskell.vim 
setlocal omnifunc=necoghc#omnifunc
$cabal install happy


require cdr (zsh zsh 4.3.11 ↑)
