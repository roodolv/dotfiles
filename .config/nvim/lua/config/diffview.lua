local diffview = require('diffview')

diffview.setup({
})

-- keymaps
vim.keymap.set("n", "<Leader>D", ":<C-u>DiffviewOpen<CR>", { noremap = true, desc = "DiffviewOpen" })

-- NOTE: modify these keymaps
-- vim.keymap.set("n", "q", ":<C-u>DiffviewClose<CR>", { noremap = true, desc = "DiffviewClose" })
-- vim.keymap.set("n", "<F5>", ":<C-u>DiffviewRefresh<CR>", { noremap = true, desc = "DiffviewRefresh" })
