local ibl = require("ibl")
local hooks = require("ibl.hooks")

local highlight = {
  -- "TokyoNightBlue",
  "TokyoNightGray",
  -- "TokyoNightWhite",
  -- "EverForestYellow",
  -- "EverForestOrange",
  -- "EverForestGray",
}
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  -- vim.api.nvim_set_hl(0, "TokyoNightBlue", { fg = "#7086D2" })
  vim.api.nvim_set_hl(0, "TokyoNightGray", { fg = "#A0A0C0" })
  -- vim.api.nvim_set_hl(0, "TokyoNightWhite", { fg = "#B9D9F0" })
  -- vim.api.nvim_set_hl(0, "EverForestYellow", { fg = "#D5C07B" })
  -- vim.api.nvim_set_hl(0, "EverForestGray", { fg = "#B9B9B9" })
  -- vim.api.nvim_set_hl(0, "EverForestOrange", { fg = "#D99975" })
end)

ibl.setup({
  debounce = 150,
  scope = { highlight = highlight },
})
