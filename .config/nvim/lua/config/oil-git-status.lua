-- show files on gitignore
require("oil-git-status").setup({
  show_ignored = true
})

-- for _, hl_group in pairs(require("oil-git-status").highlight_groups) do
--   if hl_group.index then
--     vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = "#ff0000" })
--   else
--     vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = "#00ff00" })
--   end
-- end
