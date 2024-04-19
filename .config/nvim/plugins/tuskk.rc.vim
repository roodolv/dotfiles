" Mappings
inoremap <C-j> <cmd>call tuskk#toggle()<CR>
cnoremap <C-j> <cmd>call tuskk#cmd_buf()<CR>

call tuskk#initialize({
    \ 'jisyo_list':  [
    \   { 'path': '~/.cache/vim/SKK-JISYO.L', 'encoding': 'euc-jp' },
    \   { 'path': '~/.cache/vim/SKK-JISYO.emoji', 'mark': '[E]' },
    \ ],
    \ 'kana_table': tuskk#opts#builtin_kana_table(),
    \ 'suggest_wait_ms': 200,
    \ 'suggest_sort_by': 'length',
    \ 'merge_tsu': v:true,
    \ 'trailing_n': v:true,
    \ })
