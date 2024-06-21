local staline = require("staline")

-- arrow integration
-- local arrow = require("arrow.statusline")
-- local arrow_status = function()
--   if arrow.is_on_arrow_file() == nil then
--     return ""
--   else
--     return " " .. arrow.text_for_statusline_with_icons() .. " "
--   end
-- end

-- gitsigns integration
local gitsigns_check = vim.fn.has("nvim-0.7") == 1
local git_branch = gitsigns_check
  and function()
    local branch = vim.b.gitsigns_head
    if branch == nil or branch == "" then
      return ""
    else
      return string.format("  %s %s", branch, "")
    end
  end

-- toggleterm integration
local term_number = function()
  if vim.bo.filetype == "toggleterm" then
    return "Term " .. vim.b.toggle_number
  else
    return ""
  end
end

staline.setup({
  sections = {
    left = {
      { "Staline", git_branch },
      -- { "Staline",     arrow_status },
      { "StalineFile", "file_name" },
      " ",
      "lsp",
    },
    mid = {
      { "Staline", term_number },
    },
    right = {
      " ",
      { "Staline", function() return vim.bo[0].fileencoding .. " " end, },
      "",
      " ",
      -- { "Staline", function() return vim.bo[0].filetype .. " " end, },
      { "Staline", function() return vim.bo[0].fileformat .. " " end, },
      "",
      "line_column",
    },
  },
  mode_colors = {
    -- all modes: "n", "c", "i", "ic", "s", "S", "v", "V", "", "t", "r", "R"

    ----- default
    -- n = "#84a598",
    -- c = "#8fbf7f",
    -- i = "#d4be98",
    -- v = "#fc802d",

    ----- for "tokyonight"
    c = "#e9ffe9",
    i = "#90f2f9",
    ic = "#90f2f9",
    v = "#ef79bf",
    V = "#ef79bf",
    [""] = "#ef79bf",
    r = "#ffc790",
    R = "#ffc790",
  },
  defaults = {
    true_colors = true,
    -- line_column = " [%l/%L]:%c 󰩤%p%% ",
    line_column = "[%l/%L]:%c",
    branch_symbol = " ",
  },
  special_table = {
    NvimTree = { "NvimTree", " " },
    packer = { "Packer", "󰇚 " },
    dashboard = { "Dashboard", "  " },
    help = { "Help", "󰗚 " },
    qf = { "QuickFix", " " },
    alpha = { "Alpha", "  " },
    Jaq = { "Jaq", "  " },
    Fm = { "Fm", "  " },
    TelescopePrompt = { "Telescope", "  " },
  },
})
vim.cmd([[hi StalineFile gui=underline guifg=#dddddd]]) -- File name Highlight
