-- Settings
vim.g.EasyMotion_smartcase = 1
vim.g.EasyMotion_startofline = 0 -- JK commands with column kept stayed
vim.g.EasyMotion_use_smartsign_us = 1 -- typing '1' matches both '1' and '!' in the US layout
vim.g.EasyMotion_use_migemo = 1

-- <Plug>(easymotion-s2)
vim.api.nvim_set_keymap('n', '<Leader>s', ':<C-u> execute "call EasyMotion#S(2,0,2)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', '<Leader>s', ':<C-u> execute "call EasyMotion#S(2,0,2)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>s', '<Esc>:<C-u> execute "call EasyMotion#S(2,1,2)"<CR>', { noremap = true })

-- <Plug>(easymotion-sn)
vim.api.nvim_set_keymap('n', '<Leader>z', ':<C-u> execute "call EasyMotion#S(-1,0,2)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', '<Leader>z', ':<C-u> execute "call EasyMotion#S(-1,0,2)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>z', '<Esc>:<C-u> execute "call EasyMotion#S(-1,1,2)"<CR>', { noremap = true })

-- <Plug>(easymotion-n)
vim.api.nvim_set_keymap('n', '<Leader>n', ':<C-u> execute "call EasyMotion#Search(0,0,0)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', '<Leader>n', ':<C-u> execute "call EasyMotion#Search(0,0,0)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>n', '<Esc>:<C-u> execute "call EasyMotion#Search(1,0,0)"<CR>', { noremap = true })

-- <Plug>(easymotion-N)
vim.api.nvim_set_keymap('n', '<Leader>N', ':<C-u> execute "call EasyMotion#Search(0,1,0)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', '<Leader>N', ':<C-u> execute "call EasyMotion#Search(0,1,0)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>N', '<Esc>:<C-u> execute "call EasyMotion#Search(1,1,0)"<CR>', { noremap = true })

-- <Plug>(easymotion-bd-jk), <Plug>(easymotion-overwin-line)
vim.api.nvim_set_keymap('n', '<Leader>L', ':<C-u> execute "call EasyMotion#oversion#line()"<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', '<Leader>L', ':<C-u> execute "call EasyMotion#JK(0,2)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>L', '<Esc>:<C-u> execute "call EasyMotion#JK(1,2)"<CR>', { noremap = true })

-- <Plug>(easymotion-j)
vim.api.nvim_set_keymap('n', '<Leader>j', ':<C-u> execute "call EasyMotion#JK(0,0)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', '<Leader>j', ':<C-u> execute "call EasyMotion#JK(0,0)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>j', '<Esc>:<C-u> execute "call EasyMotion#JK(1,0)"<CR>', { noremap = true })

-- <Plug>(easymotion-k)
vim.api.nvim_set_keymap('n', '<Leader>k', ':<C-u> execute "call EasyMotion#JK(0,1)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('o', '<Leader>k', ':<C-u> execute "call EasyMotion#JK(0,1)"<CR>', { noremap = true })
vim.api.nvim_set_keymap('x', '<Leader>k', '<Esc>:<C-u> execute "call EasyMotion#JK(1,1)"<CR>', { noremap = true })
