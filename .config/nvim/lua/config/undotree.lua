-- Prevent the error "'diff' is not executable" on Windows
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  vim.g.undotree_DiffCommand = vim.fn.executable("delta") == 1 and "delta" or "FC"
else
  vim.g.undotree_DiffCommand = vim.fn.executable("delta") == 1 and "delta" or "diff"
end

-- Callback function
vim.g.Undotree_CustomMap = function()
  vim.keymap.set("n", "<Esc>", "<Plug>UndotreeHide", { buffer = true, silent = true })
  vim.keymap.set("n", "<C-c><C-c>", "<Plug>UndotreeHide", { buffer = true, silent = true })
end
