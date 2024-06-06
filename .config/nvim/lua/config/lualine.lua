local lualine = require("lualine")
local lazy_status = require("lazy.status")

lualine.setup({
  sections = {
    lualine_a = {},
    lualine_b = {
      "branch",
      {
        "diff",
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        source = function()
          return vim.b.gitsigns_status_dict
        end,
      },
      "diagnostics"
    },
    lualine_c = {
      -- {
      --   "harpoon2",
      --   no_harpoon = "not loaded",
      -- },
      "filename",
    },
    lualine_x = {
      {
        lazy_status.updates,
        cond = lazy_status.has_updates,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_y = { "filetype", },
    lualine_z = { "location", },
  },
})
