local staline = require("staline")

-- harpoon integration(set callback)
-- local Harpoonline = require("harpoonline")
-- Harpoonline.setup()

-- gitsigns integration
local gitsigns_check = vim.fn.has("nvim-0.7") == 1

local git_info = (gitsigns_check) and (function()
  local branch = vim.b.gitsigns_head
  if branch == nil or branch == "" then
    return ""
  end
  local status = vim.b.gitsigns_status
  if status == nil or status == "" then
    return string.format("  %s %s", branch, "")
  else
    return string.format("  %s %s %s %s", branch, "", status, "")
  end
end)

local git_branch = (gitsigns_check) and (function()
  local branch = vim.b.gitsigns_head
  if branch == nil or branch == "" then
    return ""
  else
    return string.format("  %s ", branch)
  end
end)

local git_diff = (gitsigns_check) and (function()
  local branch = vim.b.gitsigns_head
  if branch == nil or branch == "" then
    return ""
  end
  local status = vim.b.gitsigns_status
  if status == nil or status == "" then
    return string.format("")
  else
    return string.format(" %s %s", status, "")
  end
end)

staline.setup {
  sections = {
    left = {
      ----- normal
      -- { "Staline",     git_info },
      -- { "StalineFile", "file_name" },

      ----- emphasize only branch
      { "StalineFill", git_branch },
      { "Staline",     git_diff },
      { "StalineFile", "file_name" },

      " ", "lsp"
    },
    mid = {
      -- " ", { "Staline", function() return Harpoonline.format() .. " " end },
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
    i = "#d4be98",
    n = "#aaccaa",
    c = "#e9ffe9",
    v = "#cc70bb",
  },
  defaults = {
    true_colors = true,
    -- line_column = " [%l/%L]:%c 󰩤%p%% ",
    line_column = "[%l/%L]:%c",
    branch_symbol = " ",
  }
}
vim.cmd [[hi StalineFile gui=underline guifg=#dddddd]] -- File name Highlight
