set enc=utf-8
set fenc=utf-8
scriptencoding utf-8

set nobackup
set nowritebackup
set noswapfile
set updatetime=100
set autoread
"set autowrite
set undofile undolevels=1000
execute 'set undodir=' . expand($NVIM_UNDODIR)
set hidden
set bufhidden=wipe

set hlsearch
set incsearch
set wrapscan
set ignorecase
set smartcase
set noinfercase

set number
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
set inccommand=split
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
