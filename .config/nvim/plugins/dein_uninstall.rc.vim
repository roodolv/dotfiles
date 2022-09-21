" To remove dein.vim, call this file from init.vim
" and do ':call dein#recache_runtimepath()' on Neovim
call map(dein#check_clean(), "delete(v:val, 'rf')")
