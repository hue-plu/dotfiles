#!zsh
 path=(
    /usr/local/bin
    ~/local/bin
    $path
    ~/.local/bin
    ~/.ndenv/bin
    /usr/local/share/git-core/contrib/diff-highlight
    ~/.local/src/site-packages/
    ~/go/bin
    ~/Library/Python/2.7/bin
    /usr/local/bin
    ~/.cargo/bin
    ~/.yarn/bin
    ~/.rbenv/bin
    $PYENV_ROOT/bin
    /usr/local/opt/mysql-client/bin
 )

export TERMINFO=~/.terminfo
export PYTHONPATH=~/.local/src/site-packages/
export EDITOR=vim

# ref: https://github.com/hitode909/google-ime-skk
# emacs skk server connect to google-ime
if lsof -n -iTCP:55100 | grep LISTEN > /dev/null 2>&1; then
else
  google-ime-skk > /dev/null 2>&1 &
fi

export PYENV_ROOT=$HOME/.pyenv
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export GO111MODULE=on
