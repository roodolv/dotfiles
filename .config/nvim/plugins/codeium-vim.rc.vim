" Mappings

" <<Keybindings>>
" Clear current suggestion	codeium#Clear()	<C-]>
" Next suggestion	codeium#CycleCompletions(1)	<M-]>
" Previous suggestion	codeium#CycleCompletions(-1)	<M-[>
" Insert suggestion	codeium#Accept()	<Tab>
" Manually trigger suggestion	codeium#Complete()	<M-Bslash>



" Codeium's default keybindings can be disabled by setting
"let g:codeium_disable_bindings = 1

" Neovim's example
"-- Remove the `use` here if you're using folke/lazy.nvim.
"use {
"  'Exafunction/codeium.vim',
"  config = function ()
"    -- Change '<C-g>' here to any keycode you like.
"    vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
"    vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
"    vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
"    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
"  end
"}

" Vim's key-bindings example
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>
