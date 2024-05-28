local staline = require("staline")

staline.setup {
  sections = {
    left = {
      "  ", "mode",

      -- normal
      "", "branch", "",
      { "StalineFile", "file_name" },

      -- highlight only branch
      -- "", "-branch", "",
      -- "file_name",

      -- highlight only file-name
      -- "", "branch",
      -- "", "-file_name", "",

      " ", "lsp"
    },
    mid = {},
    right = {
      "line_column", "",
      " ", { "Staline", function() return vim.bo[0].fileencoding .. " " end }, "",
      " ", { "Staline", function() return vim.bo[0].filetype .. " " end }, "",
      "cool_symbol",
    }
  },
  mode_colors = {
    -- default
    -- i = "#d4be98",
    -- n = "#84a598",
    -- c = "#8fbf7f",
    -- v = "#fc802d",

    -- for 'everforest'
    i = "#d4be98",
    n = "#aaccaa",
    c = "#e9ffe9",
    v = "#cc70bb",
  },
  defaults = {
    true_colors = true,
    line_column = " [%l/%L]:%c 󰩤%p%% ",
    branch_symbol = " ",
  }
}
vim.cmd [[hi StalineFile gui=underline guifg=#dddddd]] -- File name Highlight
