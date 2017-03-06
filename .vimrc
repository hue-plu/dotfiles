"<*********** Vim init **************>
call plug#begin('~/.vim/plugged')
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'thinca/vim-qfreplace'
  Plug 'tpope/vim-abolish'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kchmck/vim-coffee-script'

  Plug 'Shougo/vimfiler.vim'
  Plug 'Shougo/unite.vim'

  if &t_Co >= 16
    Plug 'itchyny/lightline.vim'
  elseif
    set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
    Plug 'molok/vim-smartusline'
  endif

  Plug 'Yggdroot/indentLine'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'rhysd/clever-f.vim'
  Plug 'rking/ag.vim'
  Plug 'tsukkee/lingr-vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'kana/vim-filetype-haskell'
  Plug 'eagletmt/neco-ghc'
  Plug 'eagletmt/ghcmod-vim'
  Plug 'thinca/vim-ref'
  Plug 'ujihisa/ref-hoogle'
  Plug 'thinca/vim-quickrun'
  Plug 'plasticboy/vim-markdown'
  Plug 'tyru/open-browser.vim'

  Plug 'yuku-t/vim-ref-ri'
  Plug 'junegunn/vim-easy-align'
  Plug 'haya14busa/vim-asterisk'
  Plug 'osyo-manga/vim-anzu'
  Plug 'cohama/lexima.vim'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-operator-user'
  Plug 'mattn/vim-textobj-url'
  Plug 'osyo-manga/vim-brightest'
  Plug 'tpope/vim-surround'
  Plug 'sjl/gundo.vim'
  Plug 'bkad/CamelCaseMotion'

  Plug 'Konfekt/FastFold'
  Plug 'bronson/vim-trailing-whitespace'

"----- colorscheme
  Plug 'ajh17/Spacegray.vim'
"----- colorscheme

"----- for ruby
  Plug 'osyo-manga/vim-monster'
  Plug 'tpope/vim-rails'
  Plug 'vim-scripts/AnsiEsc.vim'
  Plug 'slim-template/vim-slim'
"----- for ruby

"----- for swift
  Plug 'keith/swift.vim'
"----- for swift

"----- for javascript
  Plug 'scrooloose/syntastic'
"----- for javascript

"----- test runnner
  Plug 'janko-m/vim-test'
"----- test runnner

"----- sql formatter
  Plug 'mattn/vim-sqlfmt'
"----- sql formatter

"----- vim-diff
  Plug 'chrisbra/vim-diff-enhanced'
  Plug 'AndrewRadev/linediff.vim'
"----- vim-diff

"----- git
  Plug 'airblade/vim-gitgutter'
"-----

"----- roma to jp
  Plug 'mattn/webapi-vim'
  Plug 'vimtaku/vim-mlh'
"-----

"----- sphinx
  Plug 'Rykka/riv.vim'
"-----

call plug#end()

" @neosnippet

" " Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'

" < *********** key mapping *********** >
set autoindent smarttab noexpandtab tabstop=4 shiftwidth=4
set autoread
set backup
set clipboard+=unnamedplus
set backupdir=~/.local/share/backup
set directory=~/.local/share
set helplang=en
set hidden
set laststatus=2
set lazyredraw
set modeline
set noerrorbells
set nrformats=
set scrolloff=5
set swapfile
set whichwrap=b,s,h,l
set softtabstop=0
set synmaxcol=1000
let mapleader = ","

" ,のデフォルトの機能は、\で使えるように退避
noremap \  ,

" jj map escape key
inoremap <silent> jj <ESC>

" </*********** key mapping *********** >

" < *********** view settings *********** >
"
" Coffee Script
syntax enable

"背景の明暗
set background=dark
 
"カラースキームの設定
"
autocmd ColorScheme * highlight LineNr ctermfg=14 guifg=#81a2be
colorscheme spacegray
filetype plugin on
filetype indent on

if has('win32unix') && &term =~# '^xterm' && &t_Co < 256
  set t_Co=256  " Extend cygwin terminal color
endif


set laststatus=2

nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

" cursor block enable
if has('unix')
  let &t_ti .= "\e[1 q"  
  let &t_SI .= "\e[5 q"  
  let &t_EI .= "\e[1 q"  
  let &t_te .= "\e[0 q"  
endif

" </*********** view settings *********** >
" </*********** Vim init **************>

" plugin clever-f
" current line only 
let g:clever_f_across_no_line  = 1
" use migemo
let g:clever_f_use_migemo  = 1

" plugin ag 
let g:ag_prg="rg --column"

" lingr chat vim

" @vim-asterisk and vim-anzu
  set hlsearch
  let g:incsearch#auto_nohlsearch = 1
  
  nmap /  <Plug>(incsearch-forward)
  nmap ?  <Plug>(incsearch-backward)
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  
  map *   <Plug>(incsearch-nohl)<Plug>(asterisk-*)
  map g*  <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
  map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)
  map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)
  
  map z*  <Plug>(incsearch-nohl0)<Plug>(asterisk-z*)
  map gz* <Plug>(incsearch-nohl0)<Plug>(asterisk-gz*)
  map z#  <Plug>(incsearch-nohl0)<Plug>(asterisk-z#)
  map gz# <Plug>(incsearch-nohl0)<Plug>(asterisk-gz#)
  
  let g:incsearch#magic = '\v'

  " * 時に anzu.vim の出力を行う
  nmap * <Plug>(asterisk-z*)<Plug>(anzu-update-search-status-with-echo)
" /@vim-asterisk and vim-anzu

" vim undo
if has('persistent_undo')
  set undofile
  set undodir=./.vimundo,~/.local/share/undo
endif

"vimfiler {{{

if has('win32')
  let g:vimfiler_data_directory = 'R:\.vimfiler'
elseif  has('macunix')
  let g:vimfiler_data_directory = '~/.vimfiler'
else
  let g:vimfiler_data_directory = '~/.vimfiler'
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

" vim lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:vimfiler_force_overwrite_statusline = 0

set encoding=utf-8
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8,cp932
"set fileformats=unix,dos,mac

" vim cursorline settings
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

" @vim-brightest
let g:brightest#highlight = {
\   "group" : "BrightestUnderline"
\}
" default -> <cword>
let g:brightest#pattern = '\k\+'
" /@vim-brightest

" for haskell
" runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定できます
" updatetime が一時的に書き換えられてしまうので注意して下さい
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 60,
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1
\   },
\}
nnoremap ,ht :GhcModType<CR>
nnoremap ,hc :GhcModTypeClear<CR>

" for markdown
au BufRead,BufNewFile *.md set filetype=markdown

"----- for ruby
augroup filetypedetect
  " ruby のタブ幅は4で
  au BufNewFile,BufRead *.rb    setlocal tabstop=2 autoindent expandtab shiftwidth=2
  au BufNewFile,BufRead *.erb    setlocal tabstop=2 autoindent expandtab shiftwidth=2
  au BufNewFile,BufRead *.js    setlocal tabstop=2 autoindent expandtab shiftwidth=2
augroup END

" Use deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:monster#completion#rcodetools#backend = "async_rct_complete"

" With deoplete.nvim
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}

if !exists('loaded_matchit')
	runtime macros/matchit.vim
endif

"----- for ruby

"----- for javascript
let g:syntastic_check_on_open=0 "ファイルを開いたときはチェックしない
let g:syntastic_check_on_save=1 "保存時にはチェック
let g:syntastic_check_on_wq = 0 " wqではチェックしない
let g:syntastic_auto_loc_list=1 "エラーがあったら自動でロケーションリストを開く
let g:syntastic_loc_list_height=6 "エラー表示ウィンドウの高さ
set statusline+=%#warningmsg# "エラーメッセージの書式
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint'] "ESLintを使う
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': ['python','rst']
      \ }
"----- for javascript

"----- CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
"----- CamelCaseMotion

" align
vmap <Enter> <Plug>(EasyAlign)

" window tab mapping
nnoremap <Space> <Nop>
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
nnoremap <Space>h <C-w>h
nnoremap <Space>J <C-w>J
nnoremap <Space>K <C-w>K
nnoremap <Space>L <C-w>L
nnoremap <Space>H <C-w>H
nnoremap <Space>n gt
nnoremap <Space>p gT
nnoremap <Space>r <C-w>r
nnoremap <Space>= <C-w>=
nnoremap <Space>w <C-w>w
nnoremap <Space>N :<C-u>bn<CR>
nnoremap <Space>P :<C-u>bp<CR>
nnoremap <Space>t :<C-u>tabnew<CR>
nnoremap <Space>T :<C-u>Unite tab<CR>
nnoremap <Space>s :<C-u>sp<CR>
nnoremap <Space>v :<C-u>vs<CR>
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>Q :<C-u>bd<CR>

" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" ----- fzf
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <silent> <M-p> :History<CR>
nnoremap <silent> <c-]> :Tags <c-r><c-w><CR>

let g:fzf_tags_command = 'ctags --tag-relative -Rf.git/tags.$$ --exclude=.git --exclude=tmp --exclude=public --exclude=app/assets --languages=ruby `bundle show --paths` .'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
" ----- fzf

" ----- vim-test
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>
" ----- vim-test
