" Mappings
" Note: It's better to use ":Marks" on fzf.vim
nnoremap <silent> [m :<C-u>call signature#mark#Goto("prev", "line", "pos")<CR>
nnoremap <silent> ]m :<C-u>call signature#mark#Goto("next", "line", "pos")<CR>
nnoremap <silent> {m :<C-u>call signature#mark#Goto("prev", "line", "alpha")<CR>
nnoremap <silent> }m :<C-u>call signature#mark#Goto("next", "line", "alpha")<CR>

