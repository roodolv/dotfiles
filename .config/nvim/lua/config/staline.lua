local staline = require("staline")

-- harpoon integration
-- local harpoonline = require("harpoonline")
-- harpoonline.setup()

-- arrow integration
local arrow = require("arrow.statusline")
local arrow_status = function()
  if arrow.is_on_arrow_file() == nil then
    return ""
  else
    return " " .. arrow.text_for_statusline_with_icons() .. " "
  end
end

-- gitsigns integration
local gitsigns_check = vim.fn.has("nvim-0.7") == 1
local git_branch = (gitsigns_check) and (function()
  local branch = vim.b.gitsigns_head
  if branch == nil or branch == "" then
    return ""
  else
    return string.format("  %s %s", branch, "")
  end
end)

staline.setup({
  sections = {
    left = {
      { "Staline",     git_branch },
      { "Staline",     arrow_status },
      { "StalineFile", "file_name" },
      " ", "lsp"
    },
    mid = {
      -- " ", { "Staline", function() return harpoonline.format() .. " " end },
    },
    right = {
      " ", { "Staline", function() return vim.bo[0].fileencoding .. " " end }, "",
      " ", { "Staline", function() return vim.bo[0].filetype .. " " end }, "",
      "line_column"
    }
  },
  mode_colors = {
    ----- default
    -- i = "#d4be98",
    -- n = "#84a598",
    -- c = "#8fbf7f",
    -- v = "#fc802d",

    ----- for "everforest" colorscheme
    -- i = "#d4be98",
    -- n = "#aaccaa",
    c = "#e9ffe9",
    -- v = "#cc70bb",
  },
  defaults = {
    true_colors = true,
    -- line_column = " [%l/%L]:%c 󰩤%p%% ",
    line_column = "[%l/%L]:%c",
    branch_symbol = " ",
  },
})
vim.cmd [[hi StalineFile gui=underline guifg=#dddddd]] -- File name Highlight
