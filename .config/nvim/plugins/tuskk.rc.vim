" Mappings
inoremap <C-j> <cmd>call tuskk#toggle()<CR>
cnoremap <C-j> <cmd>call tuskk#cmd_buf()<CR>

" call tuskk#initialize({
"     \ 'jisyo_list':  [
"     \   { 'path': '~/.cache/vim/SKK-JISYO.L', 'encoding': 'euc-jp' },
"     \   { 'path': '~/.cache/vim/SKK-JISYO.emoji', 'mark': '[E]' },
"     \ ],
"     \ 'kana_table': tuskk#opts#builtin_kana_table(),
"     \ 'suggest_wait_ms': 200,
"     \ 'suggest_sort_by': 'length',
"     \ 'merge_tsu': v:true,
"     \ 'trailing_n': v:true,
"     \ })

call tuskk#initialize({
      \ 'user_jisyo_path': '~/.cache/vim/SKK-JISYO.user',
      \ 'jisyo_list':  [
      \   { 'path': '~/.cache/vim/SKK-JISYO.L', 'encoding': 'euc-jp', 'mark': '[L]' },
      \   { 'path': '~/.cache/vim/SKK-JISYO.geo', 'encoding': 'euc-jp', 'mark': '[G]' },
      \   { 'path': '~/.cache/vim/SKK-JISYO.station', 'encoding': 'euc-jp', 'mark': '[S]' },
      \   { 'path': '~/.cache/vim/SKK-JISYO.jawiki', 'encoding': 'utf-8', 'mark': '[W]' },
      \   { 'path': '~/.cache/vim/SKK-JISYO.emoji', 'encoding': 'utf-8' },
      \ ],
      \ 'kana_table': tuskk#opts#builtin_kana_table(),
      \ 'suggest_wait_ms': 200,
      \ 'suggest_prefix_match_minimum': 5,
      \ 'suggest_sort_by': 'length',
      \ 'use_google_cgi': v:true,
      \ 'merge_tsu': v:true,
      \ 'trailing_n': v:true,
      \ 'abbrev_ignore_case': v:true,
      \ })
