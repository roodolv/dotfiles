" Floating window settings
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" fzf.vim action settings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-j': 'split',
      \ 'ctrl-l': 'vsplit',
      \ }

" Rg settings for '?' switch which shows preview
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
      \ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
      \         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
      \ <bang>0)

" FZF command
function! FzfOmniFiles()
  let is_git = system('git status')
  if v:shell_error
    :Files
  else
    :GitFiles
  endif
endfunction

" MRU command
command! Fmru FZFMru
command! FZFMru
      \ call fzf#run({
      \ 'source':  v:oldfiles,
      \ 'sink':    'tabe',
      \ 'options': '-m -x +s',
      \ 'down':    '40%'
      \ })

" CLI tool 'bat' command (test)
" command! -bang -nargs=* FzfBat
"       \ call fzf#run({
"       \ 'source': 'bat --style="numbers,grid" ' . shellescape(expand('%')),
"       \ 'sink': 'e',
"       \ 'options': ['--reverse'],
"       \ 'window': { 'width': 0.9, 'height': 0.6 },
"       \ })

" Mappings
nnoremap <Leader>G :<C-u>Rg<Space>
nnoremap <silent> <Leader>F :<C-u>call FzfOmniFiles()<CR>
" nnoremap <Leader>bB :<C-u>FzfBat<CR>
nnoremap <silent> <Leader>B :<C-u>Buffers<CR>
nnoremap <silent> <Leader>U :<C-u>Fmru<CR>
nnoremap <silent> <Leader>H :<C-u>History:<CR>
nnoremap <silent> <Leader>M :<C-u>Marks<CR>
nnoremap <silent> <Leader>T :<C-u>Tags<CR>
nnoremap <silent> <Leader>bT :<C-u>BTags<CR>
nnoremap <silent> <Leader>C :<C-u>Commits<CR>
nnoremap <silent> <Leader>bC :<C-u>BCommits<CR>
