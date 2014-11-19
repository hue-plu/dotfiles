# README #

alias settings



```
#!bash
ln -s ~/rcfiles/.vimrc ~/.vimrc
ln -s ~/rcfiles/.zsh ~/.zsh
ln -s ~/rcfiles/.zshenv ~/.zshenv
ln -s ~/rcfiles/.zshrc ~/.zshrc
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