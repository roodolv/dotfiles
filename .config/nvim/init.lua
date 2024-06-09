local util = require("util")

-----------------------------------------------------------------
-- options
-----------------------------------------------------------------
-- encoding
vim.o.enc = 'utf-8'
vim.o.fencs = 'utf-8,sjis'
vim.scriptencoding = 'utf-8'

-- tabs/indent/width
-- vim.o.ambiwidth = 'double' -- comment out to use telescope.nvim
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.shiftround = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.cmd([[
retab 2
retab!
]])

-- lines/cursors
vim.o.number = true
vim.o.linebreak = true
vim.o.showbreak = '+++'
vim.o.cursorline = true
-- vim.o.cursorcolumn = true
-- vim.o.wrap = false
vim.o.display = 'lastline'
vim.o.virtualedit = 'onemore'
vim.o.backspace = 'indent,eol,start'

-- search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.wrapscan = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.infercase = false
vim.o.showmatch = true
vim.o.matchtime = 1

-- file I/O
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.autoread = true
-- vim.o.autowrite = true
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'
vim.o.hidden = true
vim.o.bufhidden = 'wipe'

-- cmdline
vim.o.showcmd = true
vim.o.cmdheight = 0
vim.o.inccommand = 'split'

-- netrw off
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

-- grep/vimgrep
vim.o.grepprg = 'rg --vimgrep'

-- etc
-- if util.is_windows() then
--   vim.o.shellslash = true
-- end
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.o.wildmode = 'list:longest'
vim.o.wildmenu = true
vim.o.laststatus = 2
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50
vim.o.visualbell = true
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.showtabline = 2 -- for staline.nvim

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

-- grep/vimgrep
vim.api.nvim_set_keymap('n', '<Leader>G', ':<C-u>grep<Space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>v', ':<C-u>vim<Space>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>V', ':<C-u>lv<Space>', { noremap = true })

-- QuickFix
vim.api.nvim_set_keymap('n', '<M-Down>', ':<C-u>cnext<CR>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Up>', ':<C-u>cprev<CR>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Right>', ':<C-u>cnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-Left>', ':<C-u>cold<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-o>', ':<C-u>cw<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-c>', ':<C-u>ccl<CR>', { noremap = true })

-- loclist
vim.api.nvim_set_keymap('n', '<C-M-Down>', ':<C-u>lnext<CR>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-Up>', ':<C-u>lprev<CR>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-Right>', ':<C-u>lnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-Left>', ':<C-u>lol<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-o>', ':<C-u>lw<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-M-c>', ':<C-u>lcl<CR>', { noremap = true })

-- tabs
vim.api.nvim_set_keymap('n', '<C-t><C-t>', ':<C-u>tabe<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w><C-w>', ':<C-u>tabc<CR>', { noremap = true })

-- vim.api.nvim_set_keymap('n', '<Leader>t', ':<C-u>terminal<CR>', { noremap = true, silent = true })

-- file/dir path
vim.api.nvim_set_keymap('n', '<F12>', ':<C-u>silent ! start %:h<CR>',
  { noremap = true, silent = true, desc = 'Open buffer flle in explorer' })
vim.api.nvim_set_keymap('n', 'gyp', ':<C-u>let @* = expand("%:p")<CR>',
  { noremap = true, silent = true, desc = "Copy buffer file's file path" })
vim.api.nvim_set_keymap('n', 'gyP', ':<C-u>let @* = expand("%:h")<CR>',
  { noremap = true, silent = true, desc = "Copy buffer file's parent dir" })
vim.api.nvim_set_keymap('n', 'gyn', ':<C-u>let @* = expand("%:t")<CR>',
  { noremap = true, silent = true, desc = "Copy buffer file's filename" })

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })

-- vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR><Esc>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-c><C-c>', ':nohl<CR><Esc>', { noremap = true, silent = true })
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

-- vim.api.nvim_set_keymap('n', '<CR>', 'o<Esc>', { noremap = true }) -- comment out for quickfix-list jump

vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.api.nvim_set_keymap('v', '*', '"zy:let @/ = @z<CR>n', { noremap = true })

-- vim.api.nvim_set_keymap('n', '<C-j>', ':<C-u>split!<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', ':<C-u>vsplit!<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<M-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-t>', 'gt', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-T>', 'gT', { noremap = true })

vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-d>', '<Delete>', { noremap = true })

-- disabled mapping----------------------------------------------
vim.api.nvim_set_keymap('n', 's', '<Nop>', { noremap = true }) -- for flash.nvim
vim.api.nvim_set_keymap('x', 's', '<Nop>', { noremap = true }) -- for flash.nvim
vim.api.nvim_set_keymap('n', 'ZZ', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ZQ', '<Nop>', { noremap = true })
vim.api.nvim_set_keymap('n', 'K', '<Nop>', { noremap = true }) -- disable NativeLSP hover


-----------------------------------------------------------------
-- filetypes
-----------------------------------------------------------------
-- C/C++/Java
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.c", "*.cpp", "*.java" },
  -- jumping between ';' and '='
  command = "set matchpairs+==:;",
})

-- Rust
vim.g.rustfmt_autosave = 1
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "rust",
  command =
  "setl cinwords=for,if,else,while,loop,impl,mod,unsafe,trait,struct,enum,fn,extern,macro expandtab tabstop=4 shiftwidth=4 softtabstop=4",
})

-- Python
vim.g.python3_host_prog = vim.fn.expand("PYTHON")
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "python",
  command =
  "setl cinwords=if,elif,else,for,while,try,except,finally,def,class expandtab tabstop=4 shiftwidth=4 softtabstop=4",
})

-- JSON
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "json",
  callback = function()
    vim.cmd([[
    command! Jq %!jq .
    command! -range Jql :<line1>,<line2>!jq .
    ]])
    vim.api.nvim_set_keymap("n", "<Leader><Leader>j", ":<C-u>Jq<CR>", { noremap = true })
    vim.api.nvim_set_keymap("v", "<Leader><Leader>j", ":<C-u>Jql<CR>", { noremap = true })
  end,
})

-- Markdown
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "markdown",
  command = "setl expandtab tabstop=4 shiftwidth=4 softtabstop=4",
})


-----------------------------------------------------------------
-- etc
-----------------------------------------------------------------
-- set default shell
if util.is_windows then
  ----- use PowerShell
  local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }
  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end

  ----- use GitBash
  -- vim.cmd [[let &shell = '"C:\Program Files\Git\bin\bash.exe"']]
  -- vim.cmd [[let &shellcmdflag = "-s"]]
else
  ----- use bash
  vim.cmd [[let &shell = "bash"]]
  vim.cmd [[let &shellcmdflag = "-s"]]
end

-- calling lazy_nvim
require('lazy_nvim')
