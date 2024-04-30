-- <leader> mapping
vim.g.mapleader = ','

-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'double'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- file-operation
vim.api.nvim_set_keymap('n', '<Leader>w', ':<C-u>w<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>wq', ':<C-u>wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':<C-u>q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Leader>q', ':<C-u>qa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':<C-u>vim<Space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>V', ':<C-u>lv<Space>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>t', ':<C-u>terminal<CR>', { noremap = true, silent = true })

-- manipulation
vim.opt.clipboard:append{'unnamedplus'}
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })

vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR><Esc>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-c><C-c>', ':nohl<CR><Esc>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true })

vim.api.nvim_set_keymap('n', 'zj', '10j', { noremap = true })
vim.api.nvim_set_keymap('n', 'zk', '10k', { noremap = true })
vim.api.nvim_set_keymap('n', 'zh', '10h', { noremap = true })
vim.api.nvim_set_keymap('n', 'zl', '10l', { noremap = true })
vim.api.nvim_set_keymap('x', 'zj', '10j', { noremap = true })
vim.api.nvim_set_keymap('x', 'zk', '10k', { noremap = true })
vim.api.nvim_set_keymap('x', 'zh', '10h', { noremap = true })
vim.api.nvim_set_keymap('x', 'zl', '10l', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-n>', '20j', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-p>', '20k', { noremap = true })
-- vim.api.nvim_set_keymap('v', '<C-n>', '20j', { noremap = true })
-- vim.api.nvim_set_keymap('v', '<C-p>', '20k', { noremap = true })

vim.api.nvim_set_keymap('n', '<CR>', 'o<Esc>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Space>', 'i<Space><Esc>', { noremap = true })

vim.api.nvim_set_keymap('n', 'yib', 'yi(', { noremap = true })
vim.api.nvim_set_keymap('n', 'cib', 'ci(', { noremap = true })
vim.api.nvim_set_keymap('n', 'dib', 'di(', { noremap = true })
vim.api.nvim_set_keymap('n', 'yab', 'ya(', { noremap = true })
vim.api.nvim_set_keymap('n', 'cab', 'ca(', { noremap = true })
vim.api.nvim_set_keymap('n', 'dab', 'da(', { noremap = true })
vim.api.nvim_set_keymap('n', 'yiB', 'yi{', { noremap = true })
vim.api.nvim_set_keymap('n', 'ciB', 'ci{', { noremap = true })
vim.api.nvim_set_keymap('n', 'diB', 'di{', { noremap = true })
vim.api.nvim_set_keymap('n', 'yaB', 'ya{', { noremap = true })
vim.api.nvim_set_keymap('n', 'caB', 'ca{', { noremap = true })
vim.api.nvim_set_keymap('n', 'daB', 'da{', { noremap = true })
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

vim.api.nvim_set_keymap('v', 'y', 'y`]', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', 'p`]', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'p', 'p`]', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v',  '*', '"zy:let @/ = @z<CR>n', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-j>', ':<C-u>split!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':<C-u>vsplit!<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<M-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-t>', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-T>', 'gT', { noremap = true })

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-d>', '<Delete>', { noremap = true })


-- Disabled mapping-----------------------------------------------------
vim.api.nvim_set_keymap('n', 's', '<Nop>', { noremap = true }) -- for vim-sandwich
vim.api.nvim_set_keymap('x', 's', '<Nop>', { noremap = true }) -- for vim-sandwich
vim.api.nvim_set_keymap('n', 'ZZ', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ZQ', '<Nop>', { noremap = true })

-- calling lazy_nvim
require("lazy_nvim")
