-- disable Codeium by default(optional)
-- vim.g.codeium_enabled = false

-- disable Codeium for particular filetypes(optional)
vim.g.codeium_filetypes = {
  TelescopePrompt = false,
}

-- mappings
vim.g.codeium_disable_bindings = 1 -- set user keymaps
local opts = { expr = true, silent = true }

-- opts.desc = "Codeium: Toggle"
-- vim.keymap.set("n", "<Leader>C", ":<C-u>CodeiumToggle<CR>", opts)
opts.desc = "Codeium: Manually trigger suggestion"
vim.keymap.set("i", "<C-s>", function()
  return vim.fn["codeium#Complete"]()
end, opts)
opts.desc = "Codeium: Clear current suggestion"
vim.keymap.set("i", "<C-x>", function()
  return vim.fn["codeium#Clear"]()
end, opts)
opts.desc = "Codeium: Accept suggestion"
vim.keymap.set("i", "<C-a>", function()
  return vim.fn["codeium#Accept"]()
end, opts)
opts.desc = "Codeium: Next suggestion"
vim.keymap.set("i", "<C-j>", function()
  return vim.fn["codeium#CycleCompletions"](1)
end, opts)
opts.desc = "Codeium: Previous suggestion"
vim.keymap.set("i", "<C-k>", function()
  return vim.fn["codeium#CycleCompletions"](-1)
end, opts)
