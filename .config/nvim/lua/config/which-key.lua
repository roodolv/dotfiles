local wk = require("which-key")

wk.setup({
})

local opts = { silent = true, noremap = true }
vim.keymap.set({ "v", "n" }, "<Leader>K", ":<C-u>WhichKey<CR>", opts)
