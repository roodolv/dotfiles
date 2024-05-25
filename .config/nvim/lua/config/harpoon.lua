local harpoon = require("harpoon")
harpoon:setup({})

-- keymaps
local keymap = vim.keymap
local opts = {}

opts.desc = "Harpoon toggle"
keymap.set("n", "<Leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
opts.desc = "Harpoon add"
keymap.set("n", "<Leader>hx", function() harpoon:list():add() end, opts)
opts.desc = "Harpoon next"
keymap.set("n", "<C-Down>", function() harpoon:list():next() end, opts)
opts.desc = "Harpoon prev"
keymap.set("n", "<C-Up>", function() harpoon:list():prev() end, opts)
opts.desc = "Harpoon select(1)"
keymap.set("n", "<Leader>h1", function() harpoon:list():select(1) end, opts)
opts.desc = "Harpoon select(2)"
keymap.set("n", "<Leader>h2", function() harpoon:list():select(2) end, opts)
opts.desc = "Harpoon select(3)"
keymap.set("n", "<Leader>h3", function() harpoon:list():select(3) end, opts)
opts.desc = "Harpoon select(4)"
keymap.set("n", "<Leader>h4", function() harpoon:list():select(4) end, opts)
