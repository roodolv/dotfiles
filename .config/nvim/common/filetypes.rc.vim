" Lang settings--------------------------------------------------------
" Jumping between ':' and '='
"autocmd FileType c,cpp,java set matchpairs+==:;

" Python
let g:python3_host_prog = expand($PYTHON)
autocmd FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Kotlin
autocmd FileType kotlin setl expandtab tabstop=4 shiftwidth=4 softtabstop=4

" Rust
let g:rustfmt_autosave = 1
" autocmd FileType rust setl cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType rust setl expandtab tabstop=4 shiftwidth=2 softtabstop=2

" Vim script
autocmd BufRead,BufNewFile *.vim set filetype=vim
autocmd FileType vim setl expandtab tabstop=4 shiftwidth=2 softtabstop=2

" JSON
autocmd FileType json command! Jq %!jq .
autocmd FileType json command! -range Jql :<line1>,<line2>!jq .
autocmd FileType json nnoremap <Leader><Leader>j :<C-u>Jq<CR>
autocmd FileType json vnoremap <Leader><Leader>j :<C-u>Jql<CR>

autocmd FileType markdown setl expandtab tabstop=8 shiftwidth=4 softtabstop=4
