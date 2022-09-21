" Options
" When v:true, the cursor always goes into a popup.
let g:git_messenger_always_into_popup = v:true

" When v:false, re-running :GitMessenger does NOT move the cursor into a popup.
let g:git_messenger_into_popup_after_show = v:false

" Including no diff hunks of a commit
" If you wanna include diff hunks of only current/all file, change it to "current" / "all"
let g:git_messenger_include_diff = "none"

" Function for autocmd
function! s:gmessenger_mappings() abort
  nnoremap <silent><buffer> <C-c><C-c> :<C-u>GitMessengerClose<CR>
  nnoremap <silent><buffer> <Esc><Esc> :<C-u>GitMessengerClose<CR>
  " Go back/forward on commit history
  nnoremap <silent><buffer> <C-o> o
  nnoremap <silent><buffer> <C-i> O
endfunction

" Execute autocmd
augroup gmessenger_settings
  autocmd! *
  autocmd FileType gitmessengerpopup call <SID>gmessenger_mappings()
augroup END

