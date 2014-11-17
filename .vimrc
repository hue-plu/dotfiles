" <*********** Vim init **************>
set nocompatible
filetype off
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell.vim'

" if_lua executable
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

if neobundle#is_installed('neocomplete')
	" neocomplete
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#enable_ignore_case = 1
	let g:neocomplete#enable_smart_case = 1
	if !exists('g:neocomplete#keyword_patterns')
		let g:neocomplete#keyword_patterns = {}
	endif
	let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
	" neocomplcache
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

NeoBundle 'Shougo/unite.vim'

syntax enable
NeoBundle 'w0ng/vim-hybrid'

colorscheme hybrid
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

" cursor block enable
if has('unix')
	let &t_ti .= "\e[1 q"  
	let &t_SI .= "\e[5 q"  
	let &t_EI .= "\e[1 q"  
	let &t_te .= "\e[0 q"  
endif


" </*********** Vim init **************>

" plugin ctrlp
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_by_filename         = 1 " refine file name

" plugin ag 
NeoBundle 'rking/ag.vim'

" ctrlp use ag command
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

" jj map escape key
inoremap <silent> jj <ESC>

 
" vim undo
if has('persistent_undo')
	set undofile
	set undodir=./.vimundo,~/.vim/undo
endif

" when unite start, insert mode
let g:unite_enable_start_insert = 1

" use smart case 
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" unite grep use ag
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" unite with vimfiler
"unite {{{

let g:unite_source_file_mru_filename_format = ''

if has('win32')
  let g:unite_data_directory = 'R:\.unite'
elseif  has('macunix')
  let g:unite_data_directory = '/Volumes/RamDisk/.unite'
else
  let g:unite_data_directory = '/mnt/ramdisk/.unite'
endif

let g:unite_source_bookmark_directory = $HOME . '/.unite/bookmark'

augroup vimrc
  autocmd FileType unite call s:unite_my_settings()
augroup END
function! s:unite_my_settings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  nnoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  inoremap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('split'))
  nnoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  inoremap <silent><buffer><expr> v unite#smart_map('v', unite#do_action('vsplit'))
  nnoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
  inoremap <silent><buffer><expr> f unite#smart_map('f', unite#do_action('vimfiler'))
endfunction

"}}}

"vimfiler {{{

if has('win32')
  let g:vimfiler_data_directory = 'R:\.vimfiler'
elseif  has('macunix')
  let g:vimfiler_data_directory = '/Volumes/RamDisk/.vimfiler'
else
  let g:vimfiler_data_directory = '/mnt/ramdisk/.vimfiler'
endif

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction

"}}}
