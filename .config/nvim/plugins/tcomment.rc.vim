" Default Leaders
"let g:tcommentMapLeader1 = '<C-_>'
"let g:tcommentMapLeader2 = '<Leader>'
"let g:tcommentMapLeaderOp1 = 'gc'
"let g:tcommentMapLeaderOp2 = 'gC'

" Customized Leaders
"nothing.

" Comment-types settings
if !exists('g:tcomment_types')
  let g:tcomment_types = {}
endif
let g:tcomment_types = {
      \ 'vimrc_comment' : "\" %s",
      \ }
" Line below is intended to be out of block above.
"       \ 'php_surround' : "<?php %s ?>",

" Adding mappings(example)
" function! SetPhpMappings()
"   nnoremap <buffer> <C-_>c :TCommentAs php_surround<CR>
"   vnoremap <buffer> <C-_>c :TCommentAs php_surround<CR>
" endfunction

" Filetype autocommands
" autocmd FileType php call SetPhpMappings()
autocmd FileType vim nnoremap <silent><buffer> gcc :TCommentAs vimrc_comment<CR>
autocmd FileType vim vnoremap <silent><buffer> gcc :TCommentAs vimrc_comment<CR>
autocmd FileType vim nnoremap <silent><buffer> <C-_><C-_> :TCommentAs vimrc_comment<CR>
autocmd FileType vim vnoremap <silent><buffer> <C-_><C-_> :TCommentAs vimrc_comment<CR>
