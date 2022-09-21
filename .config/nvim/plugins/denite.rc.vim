" Execute autocmds and distinguish them
augroup denite_settings
  autocmd! *
  autocmd FileType denite call s:denite_nmaps()
  autocmd FileType denite-filter call s:denite_imaps()
augroup END

" Replace 'file/rec' with 'ripgrep'
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git', '--color', 'never'])

" Replace 'grep' with 'ripgrep'
call denite#custom#var('grep', {
      \ 'command': ['rg'],
      \ 'default_opts': ['-S', '--vimgrep', '--no-heading'],
      \ 'recursive_opts': [],
      \ 'pattern_opt': ['--regexp'],
      \ 'separator': ['--'],
      \ 'final_opts': []
      \ })

" Enlarge max candidates
call denite#custom#source('file', 'max_candidates', 5000)
call denite#custom#source('file/rec', 'max_candidates', 10000)
" call denite#custom#source('file_mru', 'max_candidates', 100)
call denite#custom#source('directory', 'max_candidates', 3000)
call denite#custom#source('directory_rec', 'max_candidates', 5000)
call denite#custom#source('grep', 'max_candidates', 10000)

" Customize head-of-line character for prompt
call denite#custom#option('_', 'prompt', '>')

" If using lightline.vim, uncomment below.
call denite#custom#option('_', 'statusline', v:false)

" Normal-mode mappings
function! s:denite_nmaps() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> l denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <BS> denite#do_map('move_up_path')
  nnoremap <silent><buffer><expr> h denite#do_map('move_up_path')
  nnoremap <silent><buffer><expr> dd denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> ? denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select')
  nnoremap <silent><buffer><expr> J denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> K denite#do_map('toggle_select').'k'
  " Switch to filter-mode
  nnoremap <silent><buffer><expr> / denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  " Open new tab
  nnoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
  " Split window and open
  nnoremap <silent><buffer><expr> <C-j> denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> <C-l> denite#do_map('do_action', 'vsplit')
  " Escape from the current buffer
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c><C-c> denite#do_map('quit')
endfunction

" Filter(Insert)-mode mappings
function! s:denite_imaps() abort
  " Open a new tab
  inoremap <silent><buffer><expr> <C-t> denite#do_map('do_action', 'tabopen')
  " Split a window and open
  inoremap <silent><buffer><expr> <C-j> denite#do_map('do_action', 'split')
  inoremap <silent><buffer><expr> <C-l> denite#do_map('do_action', 'vsplit')
  " Escape from the current buffer
  inoremap <silent><buffer> jj <ESC>:q<CR>
  inoremap <silent><buffer> <C-c><C-c> <ESC>:q<CR>
endfunction
