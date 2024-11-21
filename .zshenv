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
    ~/.poetry/bin
    $PYENV_ROOT/bin
    /usr/local/opt/mysql-client/bin
    /usr/local/opt/ruby/bin
    ~/Library/Android/sdk/platform-tools
    ~/.nodenv/shims
	~/.config/composer/vendor/bin
 )

export LANG=ja_JP.UTF-8

export TERMINFO=~/.terminfo
export PYTHONPATH=~/.local/src/site-packages/
export EDITOR=vim

export PYENV_ROOT=$HOME/.pyenv
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export GO111MODULE=on

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '~/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '~/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
