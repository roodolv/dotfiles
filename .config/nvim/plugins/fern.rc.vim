" Execute autocmd and remove them
augroup fern_settings
  autocmd! *
  autocmd FileType fern call s:fern_init()
augroup END

let g:fern#renderer = "nerdfont"

let g:fern#disable_drawer_auto_resize = 1
" let g:fern#disable_drawer_auto_winfixwidth = 1
let g:fern#drawer_width = 35

let g:fern#default_hidden = 1

let g:fern#smart_cursor = "stick"
" let g:fern#disable_drawer_smart_quit = 1

" Initialization
function! s:fern_init() abort
  " nothing
endfunction
