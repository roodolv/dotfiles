local util = require("util")
-- Prevent the error "'diff' is not executable" on Windows
if util.is_windows then
  vim.g.undotree_DiffCommand = "FC"
end

-- Callback function
vim.g.Undotree_CustomMap = function()
  vim.keymap.set("n", "<Esc>", "<Plug>UndotreeHide", { buffer = true, silent = true })
  vim.keymap.set("n", "<C-c><C-c>", "<Plug>UndotreeHide", { buffer = true, silent = true })
end
