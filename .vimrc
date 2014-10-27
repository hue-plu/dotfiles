" <*********** Vim 初期設定設定 **************>
set nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell.vim'

" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
	" neocomplete用設定
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
	" neocomplcache用設定
	let g:neocomplcache_enable_at_startup = 1
	let g:neocomplcache_enable_ignore_case = 1
	let g:neocomplcache_enable_smart_case = 1
	if !exists('g:neocomplcache_keyword_patterns')
		let g:neocomplcache_keyword_patterns = {}
	endif
	let g:neocomplcache_keyword_patterns._ = '\h\w*'
	let g:neocomplcache_enable_camel_case_completion = 1
	let g:neocomplcache_enable_underbar_completion = 1
endif


" カラースキーム一覧表示に Unite.vim を使う
NeoBundle 'Shougo/unite.vim'

NeoBundle 'altercation/vim-colors-solarized'

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

filetype plugin on
filetype indent on

NeoBundleCheck
if has('win32unix') && &term =~# '^xterm' && &t_Co < 256
	set t_Co=256  " Extend cygwin terminal color
endif

if &t_Co >= 16
	NeoBundle 'bling/vim-airline'
elseif
	set laststatus=2
	set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
	NeoBundle 'molok/vim-smartusline'
endif

if has('unix')
	let &t_ti .= "\e[1 q"  " 端末を termcap モードにする
	let &t_SI .= "\e[5 q"  " 挿入モード開始(バー型のカーソル)
	let &t_EI .= "\e[1 q"  " 挿入モード終了(ブロック型カーソル)
	let &t_te .= "\e[0 q"  " termcap モードから抜ける
endif


" </*********** Vim 初期設定設定 **************>

" plugin ctrlp
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_by_filename         = 1 " フルパスではなくファイル名のみで絞込

" plugin ag 
NeoBundle 'rking/ag.vim'

" ctrlpプラグインの検索にagを使用
let g:ctrlp_user_command = 'ag %s -l'

set autoindent
set autoread
set backup
set backupdir=~/.vim/backup
set clipboard=unnamed,autoselect
set cursorline
set directory=~/.vim/swap
set helplang=en
set hidden
set laststatus=2
set lazyredraw
set list
set listchars=tab:^\ ,trail:~
set modeline
set noerrorbells
set nrformats=
set number
set scrolloff=5
set swapfile
set ttyfast
set visualbell t_vb=
set whichwrap=b,s,h,l
set tabstop=4
set shiftwidth=4
set softtabstop=0

" jjをESCキーとする
inoremap <silent> jj <ESC>

 
" Vimを終了してもUndo
if has('persistent_undo')
	set undofile
	set undodir=./.vimundo,~/.vim/undo
endif

" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

