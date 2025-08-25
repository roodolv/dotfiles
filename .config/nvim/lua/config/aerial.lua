local aerial = require("aerial")

aerial.setup({
  on_attach = function(bufnr)
    local filetype = vim.bo[bufnr].filetype
    if filetype == "markdown" or filetype == "markdown.mdx" or filetype == "txt" then
      vim.keymap.set("n", "{", ":<C-u>AerialPrev<CR>", { silent = true, buffer = bufnr, desc = "AerialPrev" })
      vim.keymap.set("n", "}", ":<C-u>AerialNext<CR>", { silent = true, buffer = bufnr, desc = "AerialNext" })
    end
  end,
})

vim.keymap.set("n", "<Leader>A", ":<C-u>AerialToggle!<CR>", { silent = true, desc = "AerialToggle" })
