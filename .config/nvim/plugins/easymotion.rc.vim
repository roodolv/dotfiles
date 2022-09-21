" Settings
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " JK commands with column kept stayed
let g:EasyMotion_use_smartsign_us = 1 " typing '1' matches both '1' and '!' in the US layout
let g:EasyMotion_use_migemo = 1

" <Plug>(easymotion-s2)
nnoremap <Leader>s :<C-u>execute 'call EasyMotion#S(2,0,2)'<CR>
onoremap <Leader>s :<C-u>execute 'call EasyMotion#S(2,0,2)'<CR>
xnoremap <Leader>s <Esc>:<C-u>execute 'call EasyMotion#S(2,1,2)'<CR>

" <Plug>(easymotion-sn)
nnoremap <Leader>z :<C-u>execute 'call EasyMotion#S(-1,0,2)'<CR>
onoremap <Leader>z :<C-u>execute 'call EasyMotion#S(-1,0,2)'<CR>
xnoremap <Leader>z <Esc>:<C-u>execute 'call EasyMotion#S(-1,1,2)'<CR>

" <Plug>(easymotion-n)
nnoremap <Leader>n :<C-u>execute 'call EasyMotion#Search(0,0,0)'<CR>
onoremap <Leader>n :<C-u>execute 'call EasyMotion#Search(0,0,0)'<CR>
xnoremap <Leader>n <Esc>:<C-u>execute 'call EasyMotion#Search(1,0,0)'<CR>

" <Plug>(easymotion-N)
nnoremap <Leader>N :<C-u>execute 'call EasyMotion#Search(0,1,0)'<CR>
onoremap <Leader>N :<C-u>execute 'call EasyMotion#Search(0,1,0)'<CR>
xnoremap <Leader>N <Esc>:<C-u>execute 'call EasyMotion#Search(1,1,0)'<CR>

" <Plug>(easymotion-bd-jk), <Plug>(easymotion-overwin-line)
nnoremap <Leader>L :<C-u>execute 'call EasyMotion#overwin#line()'<CR>
onoremap <Leader>L :<C-u>execute 'call EasyMotion#JK(0,2)'<CR>
xnoremap <Leader>L <Esc>:<C-u>execute 'call EasyMotion#JK(1,2)'<CR>

" <Plug>(easymotion-j)
nnoremap <Leader>j :<C-u>execute 'call EasyMotion#JK(0,0)'<CR>
onoremap <Leader>j :<C-u>execute 'call EasyMotion#JK(0,0)'<CR>
xnoremap <Leader>j <Esc>:<C-u>execute 'call EasyMotion#JK(1,0)'<CR>

" <Plug>(easymotion-k)
nnoremap <Leader>k :<C-u>execute 'call EasyMotion#JK(0,1)'<CR>
onoremap <Leader>k :<C-u>execute 'call EasyMotion#JK(0,1)'<CR>
xnoremap <Leader>k <Esc>:<C-u>execute 'call EasyMotion#JK(1,1)'<CR>
