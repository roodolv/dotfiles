" Initialization-------------------------------------------------------
if &compatible
  set nocompatible
endif

runtime! ./common/options.rc.vim
runtime! ./common/filetypes.rc.vim
runtime! ./common/mappings.rc.vim
runtime! ./common/other.rc.vim
" End Initialization---------------------------------------------------


" dein.vim-------------------------------------------------------------
let s:dein_cache = expand('~/.cache/dein.vim')
let s:dein_repo = s:dein_cache
      \ . '/repos/github.com/Shougo/dein.vim'

let g:dein#install_github_api_token = expand($GITHUB_TOKEN)

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_repo)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_repo, ':p')
endif

if dein#load_state(s:dein_cache)
  call dein#begin(s:dein_cache)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy' : 1})
  call dein#load_toml('~/.config/nvim/dein_filetype.toml')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" End dein.vim---------------------------------------------------------


" Appearances----------------------------------------------------------
filetype plugin indent on
syntax enable
runtime! ./common/theme.rc.vim
" End Appearances------------------------------------------------------
