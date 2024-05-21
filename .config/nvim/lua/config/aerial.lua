local aerial = require("aerial")

aerial.setup({
  on_attach = function(bufnr)
    vim.keymap.set("n", "{", ":<C-u>AerialPrev<CR>", { buffer = bufnr, desc = "AerialPrev" })
    vim.keymap.set("n", "}", ":<C-u>AerialNext<CR>", { buffer = bufnr, desc = "AerialNext" })
  end,
})

vim.keymap.set("n", "<Leader>A", ":<C-u>AerialToggle!<CR>", { desc = "AerialToggle" })
