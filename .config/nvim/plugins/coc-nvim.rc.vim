" Auto Installation List
let g:coc_global_extensions = [
      \ 'coc-fzf-preview',
      \ 'coc-lists',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-pyright',
      \ 'coc-rls',
      \ 'coc-rust-analyzer',
      \ 'coc-tslint',
      \ 'coc-tsserver',
      \ ]

" Mappings for definition jump
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Press <TAB>/<S-TAB> to move cursor
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  " Return TRUE when col is Zero or the char before cursor is whitespace
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Press <CR> to determine
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
