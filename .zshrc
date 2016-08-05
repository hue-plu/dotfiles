## vcs git
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null

function rprompt-git-current-branch {
        local name st color gitdir action
        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
                return
        fi

        name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
        if [[ -z $name ]]; then
                return
        fi

        gitdir=`git rev-parse --git-dir 2> /dev/null`
        action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

	if [[ -e "$gitdir/rprompt-nostatus" ]]; then
		echo "$name$action "
		return
	fi

        st=`git status 2> /dev/null`
	if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
		color=%F{green}
	elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
		color=%F{yellow}
	elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
                color=%B%F{red}
        else
                color=%F{red}
        fi

        echo "$color$name$action%f%b "
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

PROMPT=$'%2F%n@%m%f%1v%# '
RPROMPT='[`rprompt-git-current-branch`%~]'

# alias for git
gst  () { git status -s && git stash list }
glgg () { git log --stat --pretty=format:'%Cblue%h %Cgreen%ar %Cred%an %Creset%s %Cred%d%Creset' }
glg  () { glgg | head }
gc   () { git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`}

# alias for ls
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ls='ls -G'

## /vcs git

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/local/lib
export LD_LIBRARY_PATH

#履歴の保存先
HISTFILE=$HOME/.zsh-history
# メモリに展開する履歴の数
HISTSIZE=100000
# 保存する履歴の数
SAVEHIST=100000

fpath=(~/dotfiles/.zsh/completion $fpath)

autoload -U compinit
# 補完機能の強化
compinit -u -C

# コアダンプサイズを制限
limit coredumpsize 102400
# 出力の文字列末尾に改行コードが無い場合でも表示
unsetopt promptcr
# Emacsライクキーバインド設定
bindkey -e

# 色を使う
setopt prompt_subst
# ビープを鳴らさない
setopt nobeep
# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs
# 補完候補一覧でファイルの種別をマーク表示
setopt list_types
# サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt auto_resume
# 補完候補を一覧表示
setopt auto_list
# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
# cd 時に自動で push
setopt auto_pushd
# 同じディレクトリを pushd しない
setopt pushd_ignore_dups
# ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob
# TAB で順に補完候補を切り替える
setopt auto_menu
# zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt extended_history
# =command を command のパス名に展開する
setopt equals
# --prefix=/usr などの = 以降も補完
setopt magic_equal_subst
# ヒストリを呼び出してから実行する間に一旦編集
setopt hist_verify
# ファイル名の展開で辞書順ではなく数値的にソート
setopt numeric_glob_sort
# 出力時8ビットを通す
setopt print_eight_bit
# ヒストリを共有
setopt share_history
# 補完の判定を大文字小文字どちらでも
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
# 補完候補の色づけ
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors \
'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# ディレクトリ名だけで cd
setopt auto_cd
# カッコの対応などを自動的に補完
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash
# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl
# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control
# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space
# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments
# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store
# 補完候補を詰めて表示
setopt list_packed
# 最後のスラッシュを自動的に削除しない
setopt noautoremoveslash

# setting for peco
for f (~/.zsh/peco-sources/*) source "${f}" # load peco sources
for f (~/.zsh/tools/*) source "${f}" # load peco sources

# os settings
if [[ "$OSTYPE" =~ "cygwin" ]];then
else
	export LANG=ja_JP.UTF-8
fi

# haskell need en_US.utf8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# cdr の設定
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/shell/chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

# mysql
export MYSQL_PS1='\u@\h[\d]> '

eval "$(rbenv init -)"
eval "$(ndenv init -)"

