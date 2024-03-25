" Option settings
let g:startify_files_number = 5
let g:startify_session_number = 15
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

" Lists on startup
let g:startify_lists = [
      \ {'type': 'files', 'header': ['Recently Used:']},
      \ {'type': 'dir', 'header': ['Recently Used (CurrentDir):']},
      \ {'type': 'sessions', 'header': ['Sessions:']},
      \ {'type': 'bookmarks', 'header': ['Bookmarks:']},
      \ ]

" Bookmark setting
let g:startify_bookmarks = [
      \ "~/.config/nvim/init.vim",
      \ "~/.config/nvim/dein.toml",
      \ "~/.config/nvim/dein_lazy.toml",
      \ ]

" Mappings
nnoremap <silent> <Leader><Leader><Space> :Startify<CR> " Call back Startify
nnoremap <silent> <Leader><Space>s :SSave!<CR> " Save session
nnoremap <silent> <Leader><Space>l :SLoad!<CR> " Load session
nnoremap <silent> <Leader><Space>c :SClose<CR> " Close session
nnoremap <silent> <Leader><Space>dd :SDelete!<CR> " Delete session

" Show welcome-message centered
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

" Welcome page's message
let g:startify_custom_header = s:filter_header([
      \ '<<Neovim>>',
      \ ])

