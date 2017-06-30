#!zsh
 path=(
    usr/local/bin
    ~/local/bin
    $path
    ~/.local/bin
    ~/.ndenv/bin
    /usr/local/share/git-core/contrib/diff-highlight
    ~/.local/src/site-packages/
    ~/go/bin
    ~/Library/Python/2.7/bin
    /usr/local/bin
 )

export TERMINFO=~/.terminfo
export PYTHONPATH=~/.local/src/site-packages/

# ref: https://github.com/hitode909/google-ime-skk
# emacs skk server connect to google-ime
if lsof -n -iTCP:55100 | grep LISTEN > /dev/null 2>&1; then
else
  ~/.rbenv/versions/2.4.0/bin/google-ime-skk > /dev/null 2>&1 &
fi
