-- Profiles
-- require('fzf-lua').setup({'default'})
require('fzf-lua').setup({'telescope'})

-- Buffers & Files
vim.keymap.set("n", "<Leader>ff", ":<C-u>FzfLua files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fh", ":<C-u>FzfLua oldfiles<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fb", ":<C-u>FzfLua buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>ft", ":<C-u>FzfLua tabs<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Leader>fr", ":<C-u>FzfLua files resume=true<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fr", ":<C-u>FzfLua resume<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>fl", ":<C-u>FzfLua lines<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fbl", ":<C-u>FzfLua blines<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>fll", ":<C-u>FzfLua loclist<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fq", ":<C-u>FzfLua quickfix<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<Leader>fa", ":<C-u>FzfLua args<CR>", { noremap = true, silent = true })

-- Search
  -- same as :RG in fzf.vim
vim.keymap.set("n", "<Leader>fg", ":<C-u>FzfLua grep_project<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fG", ":<C-u>FzfLua grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fgg", ":<C-u>FzfLua grep_last<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fgiw", ":<C-u>FzfLua grep_cword<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fgiW", ":<C-u>FzfLua grep_cWORD<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fgt", ":<C-u>FzfLua tags_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fst", ":<C-u>FzfLua tags<CR>", { noremap = true, silent = true })

-- Git
vim.keymap.set("n", "<Leader>glsf", ":<C-u>FzfLua git_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gst", ":<C-u>FzfLua git_status<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>gll", ":<C-u>FzfLua git_commits<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>glb", ":<C-u>FzfLua git_bcommits<CR>", { noremap = true, silent = true })

-- LSP/Diagnostics
vim.keymap.set("n", "<Leader>flr", ":<C-u>FzfLua lsp_references<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fld", ":<C-u>FzfLua lsp_definitions<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fldc", ":<C-u>FzfLua lsp_declarations<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>flt", ":<C-u>FzfLua lsp_typedefs<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fli", ":<C-u>FzfLua lsp_implementations<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fla", ":<C-u>FzfLua lsp_code_actions<CR>", { noremap = true, silent = true })

-- nvim-dap
