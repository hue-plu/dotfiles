" Install plugins

let s:jetpackfile = '~/.config/nvim/autoload/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'morhetz/gruvbox'
Jetpack 'itchyny/lightline.vim'
call jetpack#end()

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor

" options
set autoindent smarttab noexpandtab tabstop=4 shiftwidth=4
set autoread
set backup
set clipboard+=unnamedplus
set backupdir=~/.local/share/backup
set directory=~/.local/share
let $LANG = 'en_US'
set langmenu=en_US.UTF-8
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
set background=dark
set noshowmode
let mapleader = ","

" jj map escape key
inoremap <silent> jj <ESC>

" colorScheme
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
autocmd ColorScheme * highlight SignColumn ctermbg=none
colorscheme gruvbox
filetype plugin on
filetype indent on

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" vim undo
if has('persistent_undo')
  set undofile
  set undodir=./.vimundo,~/.local/share/undo
endif

" window tab mapping
nnoremap <Space> <Nop>
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>wl <C-w>l
nnoremap <Space>wh <C-w>h
nnoremap <Space>wJ <C-w>J
nnoremap <Space>wK <C-w>K
nnoremap <Space>wL <C-w>L
nnoremap <Space>wH <C-w>H
nnoremap <Space>wn gt
nnoremap <Space>wp gT
nnoremap <Space>wr <C-w>r
nnoremap <Space>w= <C-w>=
nnoremap <Space>ww <C-w>w
nnoremap <Space>wN :<C-u>bn<CR>
nnoremap <Space>wP :<C-u>bp<CR>
nnoremap <Space>wt :<C-u>tabnew<CR>
nnoremap <Space>wT :<C-u>Unite tab<CR>
nnoremap <Space>ws :<C-u>sp<CR>
nnoremap <Space>wv :<C-u>vs<CR>
nnoremap <Space>wq :<C-u>q<CR>
nnoremap <Space>wd :<C-u>q<CR>
nnoremap <Space>wQ :<C-u>bd<CR>

