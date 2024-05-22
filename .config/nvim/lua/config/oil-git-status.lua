local ogs = require("oil-git-status")
ogs.setup({
  -- show files on gitignore
  show_ignored = true
})

-- for _, hl_group in pairs(ogs.highlight_groups) do
--   if hl_group.index then
--     vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = "#ff0000" })
--   else
--     vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = "#00ff00" })
--   end
-- end
