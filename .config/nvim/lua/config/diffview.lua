local diffview = require("diffview")

diffview.setup({
})

-- keymaps
local opts = { silent = true, noremap = true }
opts.desc = "DiffviewOpen"
vim.keymap.set("n", "<Leader>D", ":<C-u>DiffviewOpen<CR>", opts)
-- opts.desc = "DiffviewClose"
-- vim.keymap.set("n", "<Leader>dc", ":<C-u>DiffviewClose<CR>", opts)
opts.desc = "DiffviewRefresh"
vim.keymap.set("n", "<Leader>dr", ":<C-u>DiffviewRefresh<CR>", opts)
