local nnb = require("nvim-navbuddy")

nnb.setup({
  window = {
    size = { height = "40%", width = "100%" },
    position = { row = "100%", col = "50%" },
  },
})

vim.keymap.set("n", "<Leader>N", function() nnb.open() end, { desc = "navbuddy open()" })
