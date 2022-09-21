" True Color-----------------------------------------------------------
if has('nvim')
  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1

  " Or if you have Neovim >= 0.1.5
  if (has("termguicolors"))
    set termguicolors
  endif
elseif has('patch-7.4.1778')
  set guicolors
endif


" Theme----------------------------------------------------------------
set background=dark

" ayu
" call dein#add('ayu-theme/ayu-vim')
colorscheme ayu

