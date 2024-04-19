" Core settings----------------------------
filetype plugin indent on
syntax enable

set enc=utf-8
set fencs=utf-8,sjis
scriptencoding utf-8

set nobackup
set nowritebackup
set noswapfile
set updatetime=100
set autoread
"set autowrite
set hidden
set bufhidden=wipe

set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase
set noinfercase

set number
set ruler
set linebreak
set showbreak=+++
set cursorline
"set cursorcolumn
"set nowrap
set display=lastline
set virtualedit=onemore
set backspace=indent,eol,start
set showmatch
set matchtime=3

set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent
retab 2
retab!

set clipboard=unnamed,unnamedplus
"set shellslash
set showcmd
"set inccommand=split
set wildmode=list:longest
set wildmenu
set laststatus=2
set visualbell
set mouse=a

set list listchars=extends:>,precedes:<,nbsp:%
set listchars^=trail:_
set listchars^=eol:↲
set listchars^=tab:>.
set matchpairs& matchpairs+=<:>

set tags=./tags;

" quickfix&vimgrep
packadd cfilter
autocmd QuickFixCmdPost *grep* cw


" Keymaps----------------------------------
let mapleader = ","
"let mapleader = "\<Space>"

nnoremap <Leader>w :<C-u>w<CR>
"nnoremap <Leader>wq :<C-u>wq<CR>
nnoremap <silent> <Leader>q :<C-u>q<CR>
nnoremap <silent> <Leader><Leader>q :<C-u>qa<CR>

nnoremap <Leader>v :<C-u>vim<Space>/
nnoremap <Leader>V :<C-u>lv<Space>/

nnoremap <silent> <Leader>t :<C-u>terminal<CR>

nnoremap yib yi(
nnoremap cib ci(
nnoremap dib di(
nnoremap yab ya(
nnoremap cab ca(
nnoremap dab da(
nnoremap yiB yi{
nnoremap ciB ci{
nnoremap diB di{
nnoremap yaB ya{
nnoremap caB ca{
nnoremap daB da{
nnoremap Y y$
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
vnoremap * "zy:let @/ = @z<CR>n

noremap - ^
noremap _ $

nnoremap j gj
nnoremap k gk
"vnoremap j gj
"vnoremap k gk
"set whichwrap=b,s,[,],<,>
nnoremap zj 10j
nnoremap zk 10k
nnoremap zh 10h
nnoremap zl 10l
xnoremap zj 10j
xnoremap zk 10k
xnoremap zh 10h
xnoremap zl 10l
"nnoremap <C-n> 20j
"nnoremap <C-p> 20k
"vnoremap <C-n> 20j
"vnoremap <C-p> 20k

nnoremap n nzz
nnoremap N Nzz
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
nnoremap <silent> <C-c><C-c> :<C-u>nohlsearch<CR><Esc>

nnoremap <CR> o<Esc>
"nnoremap <Space> i<Space><Esc>

nnoremap <silent> <C-j> :<C-u>split<CR>
nnoremap <silent> <C-l> :<C-u>vsplit<CR>
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-t> gt
nnoremap <M-T> gT

inoremap jj <Esc>
inoremap <C-c> <Esc>
inoremap <C-d> <Delete>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>


" Filetypes--------------------------------
augroup ftgroup
  autocmd!

  " Jumping between ':' and '='
  "autocmd FileType c,cpp,java set matchpairs+==:;

  let g:python3_host_prog = expand($PYTHON)
  autocmd FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python setl expandtab tabstop=4 shiftwidth=2 softtabstop=2

  autocmd FileType kotlin setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

  let g:rustfmt_autosave = 1
  "autocmd FileType rust setl cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType rust setl expandtab tabstop=8 shiftwidth=4 softtabstop=4

  autocmd BufRead,BufNewFile *.vim set filetype=vim
  autocmd FileType vim setl expandtab tabstop=4 shiftwidth=2 softtabstop=2

  autocmd FileType json command! Jq %!jq .
  autocmd FileType json command! -range Jql :<line1>,<line2>!jq .
  autocmd FileType json nnoremap <Leader><Leader>j :<C-u>Jq<CR>
  autocmd FileType json vnoremap <Leader><Leader>j :<C-u>Jql<CR>

  autocmd FileType markdown setl expandtab tabstop=8 shiftwidth=4 softtabstop=4
augroup END

