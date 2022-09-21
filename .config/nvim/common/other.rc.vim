" Quickfix&vimgrep settings--------------------------------------------
packadd cfilter
autocmd QuickFixCmdPost *grep* cw
