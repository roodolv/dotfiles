require("modes").setup({
  colors = {
    copy = "#ffcf00",
    delete = "#ff0000",
    insert = "#90f2f9",
    -- visual = "#efefef",
    visual = "#ffafff",
  },
  line_opacity = 0.2,
  set_cursor = false,
  set_cursorline = true,
  set_number = false,
  ignore_filetypes = { "NvimTree", "TelescopePrompt" },
})
