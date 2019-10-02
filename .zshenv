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
