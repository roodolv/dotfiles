local diffview = require("diffview")

diffview.setup({
})

-- keymaps
vim.keymap.set("n", "<Leader>D", ":<C-u>DiffviewOpen<CR>", { noremap = true, desc = "DiffviewOpen" })
-- vim.keymap.set("n", "<Leader>dc", ":<C-u>DiffviewClose<CR>", { noremap = true, desc = "DiffviewClose" })
vim.keymap.set("n", "<Leader>dr", ":<C-u>DiffviewRefresh<CR>", { noremap = true, desc = "DiffviewRefresh" })
