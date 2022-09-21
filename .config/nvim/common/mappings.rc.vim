" Customized mapping---------------------------------------------------
let mapleader = ","
" let mapleader = "\<Space>"

nnoremap <Leader>w :<C-u>w<CR>
" nnoremap <Leader>wq :<C-u>wq<CR>
nnoremap <silent> <Leader>q :<C-u>q<CR>
nnoremap <silent> <Leader><Leader>q :<C-u>qa<CR>

nnoremap <Leader>v :<C-u>vim<Space>/
nnoremap <Leader>V :<C-u>lv<Space>/

" nnoremap <silent> <Leader>t :<C-u>terminal<CR>

nnoremap yib yi(
nnoremap cib ci(
nnoremap dib di(
nnoremap yab ya(
nnoremap cab ca(
nnoremap dab da(
nnoremap yiB yi{
nnoremap ciB ci{
nnoremap diB di{
nnoremap yaB ya{
nnoremap caB ca{
nnoremap daB da{
nnoremap Y y$
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
vnoremap * "zy:let @/ = @z<CR>n

" noremap - ^
" noremap _ $

nnoremap j gj
nnoremap k gk
" vnoremap j gj
" vnoremap k gk
" set whichwrap=b,s,[,],<,>
nnoremap zj 10j
nnoremap zk 10k
nnoremap zh 10h
nnoremap zl 10l
xnoremap zj 10j
xnoremap zk 10k
xnoremap zh 10h
xnoremap zl 10l
nnoremap <C-n> 20j
nnoremap <C-p> 20k
vnoremap <C-n> 20j
vnoremap <C-p> 20k

nnoremap n nzz
nnoremap N Nzz
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR><Esc>
nnoremap <silent> <C-c><C-c> :<C-u>nohlsearch<CR><Esc>

nnoremap <CR> o<Esc>
" nnoremap <Space> i<Space><Esc>

nnoremap <silent> <C-j> :<C-u>split<CR>
nnoremap <silent> <C-l> :<C-u>vsplit<CR>
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap <M-t> gt
nnoremap <M-T> gT

inoremap jj <Esc>
inoremap <C-c> <Esc>
inoremap <C-d> <Delete>


" Disabled mapping-----------------------------------------------------
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

