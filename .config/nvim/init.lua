-----------------------------------------------------------------
-- options
-----------------------------------------------------------------
-- encoding
vim.o.enc = 'utf-8'
vim.o.fencs = 'utf-8,sjis'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'double'
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftround = true
vim.o.autoindent = true
vim.o.smartindent = true
-- TODO
vim.cmd([[
retab 2
retab!
]])

-- search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.wrapscan = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.cmd([[set noinfercase]])
vim.o.showmatch = true
vim.o.matchtime = 1

-- file I/O
-- TODO
vim.cmd([[set nobackup]])
vim.cmd([[set nowritebackup]])
vim.cmd([[set noswapfile]])
vim.o.updatetime = 100
vim.o.autoread = true
-- set autowrite
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'
vim.o.hidden = true
vim.o.bufhidden = 'wipe'

-- lines/cursors
vim.o.number = true
vim.o.linebreak = true
vim.o.showbreak = '+++'
vim.o.cursorline = true
-- vim.o.cursorcolumn = true
-- vim.o.nowrap = true
vim.o.display = 'lastline'
vim.o.virtualedit = 'onemore'
vim.o.backspace = 'indent,eol,start'

-- etc
-- vim.o.clipboard = 'unnamed,unnamedplus'
vim.opt.clipboard:append{'unnamed', 'unnamedplus'}
-- vim.o.shellslash = true
vim.o.showcmd = true
vim.o.inccommand = 'split'
vim.o.wildmode = 'list:longest'
vim.o.wildmenu = true
vim.o.laststatus = 2
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
vim.o.visualbell = true
vim.o.mouse = 'a'

-- TODO
vim.cmd([[
set list listchars=extends:>,precedes:<,nbsp:%
set listchars^=trail:_
set listchars^=eol:↲
set listchars^=tab:>.
set matchpairs& matchpairs+=<:>
set tags=./tags;
]])

-----------------------------------------------------------------
-- mappings
-----------------------------------------------------------------
vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<Leader>w', ':<C-u>w<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<Leader>wq', ':<C-u>wq<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':<C-u>q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Leader>q', ':<C-u>qa<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':<C-u>vim<Space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>V', ':<C-u>lv<Space>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>t', ':<C-u>terminal<CR>', { noremap = true, silent = true })

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

-- disabled mapping-----------------------------------------------------
vim.api.nvim_set_keymap('n', 's', '<Nop>', { noremap = true }) -- for vim-sandwich
vim.api.nvim_set_keymap('x', 's', '<Nop>', { noremap = true }) -- for vim-sandwich
vim.api.nvim_set_keymap('n', 'ZZ', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ZQ', '<Nop>', { noremap = true })

-- calling lazy_nvim
require('lazy_nvim')
