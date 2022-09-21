" Components
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ],
      \   'right': [  [ 'percent', 'syntastic', 'lineinfo' ],
      \               [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


" Settings for fern.vim & fugitive.vim
function! LightlineModified()
  return &ft =~# 'help\|fern\|neoterm' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|fern\|qf\|neoterm' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
      \ (&ft ==# 'fern' ? 'fern-tree' :
      \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]') .
      \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if exists('*FugitiveHead')
    let git_mark = ' '
    let branch_name = FugitiveHead()
    return branch_name !=# '' ? git_mark.branch_name : ''
  endif
  return ''
endfunction

function! LightlineFileformat()
  return &ft =~# 'fern\|denite\|denite-filter\|startify\|qf' ? '' :
      \ winwidth(0) < 70 ? '' :
      \ &ff =~# 'unix\|mac\|dos' ? &ff : ''
endfunction

function! LightlineFiletype()
  return &ft =~# 'fern\|denite\|denite-filter\|startify\|qf\|neoterm' ? '' :
      \ winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return &ft =~# 'fern\|denite\|denite-filter\|startify' ? '' :
      \ winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  " let fname = expand('%:t')
  return &ft ==# 'fern' ? 'FERN' :
      \ &ft ==# 'denite' ? 'DENITE' :
      \ &ft ==# 'denite-filter' ? 'DENITE FILTER' :
      \ &ft ==# 'startify' ? 'STARTIFY' :
      \ &ft =~# 'qf' ? 'QUICKFIX' :
      \ &ft =~# 'neoterm' ? 'TERMINAL' :
      \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

