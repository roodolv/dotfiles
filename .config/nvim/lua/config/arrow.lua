local arrow = require("arrow")
local persist = require("arrow.persist")

arrow.setup({
  leader_key = "'", -- single-quote
  buffer_leader_key = "\\",
  save_path = function()
    return vim.fn.stdpath("cache") .. "/arrow"
  end,
  show_icons = true,
  -- hide_handbook = true,
  per_buffer_config = {
    lines = 6,
    sort_automatically = true,
    satellite = {
      enable = false,
      overlap = true,
      priority = 1000,
    },
    zindex = 10, --default 50
  },
})

local opts = { silent = true, noremap = true }

-- opts.desc = "arrow toggle"
-- vim.keymap.set("n", "<C-s>", persist.toggle, opts)
opts.desc = "arrow next"
vim.keymap.set("n", "<S-Down>", persist.next, opts)
opts.desc = "arrow previous"
vim.keymap.set("n", "<S-Up>", persist.previous, opts)
