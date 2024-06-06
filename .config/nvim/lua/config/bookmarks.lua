local bookmarks = require("bookmarks")

bookmarks.setup({
  storage_dir = "",
  mappings_enabled = true,
  keymap = {
    ----- global keymaps
    toggle = "<Tab><Tab>",
    -- add = "\\z",
    add = "<Leader>bl",
    -- add_global = "\\g", -- identified with the symbol '󰯾'
    add_global = "<Leader>bg", -- identified with the symbol '󰯾'
    -- delete_on_virt = "\\dd",
    delete_on_virt = "<Leader>bd",
    -- show_desc = "\\sd",
    show_desc = "<Leader>bs",

    ----- buf keymaps
    close = "q",
    jump = "<CR>",
    delete = "dd",
    order = "<Space><Space>",
    focus_tags = "<C-j>",
    focus_bookmarks = "<C-k>",
    toogle_focus = "<S-Tab>",
  },
  width = 0.9,          -- (0, 1]
  height = 0.65,        -- (0, 1]
  preview_ratio = 0.35, -- (0, 1]
  tags_ratio = 0.1,
  fix_enable = true,

  virt_text = "",
  sign_icon = "󰃃",
  virt_pattern = { "*.go", "*.lua", "*.sh", "*.php", "*.rs" },
  virt_ignore_pattern = {},
  border_style = "single", -- "single" | "double" | "rounded"
  hl = {
    border = "TelescopeBorder",
    cursorline = "guibg=Gray guifg=White",
  }
})
