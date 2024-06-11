require("modes").setup({
  colors = {
    copy   = "#ffc300",
    -- delete = "#c75c6a",
    delete = "#ff0000",
    insert = "#78ccc5",
    -- visual = "#9745be",
    visual = "#efefef",
  },
  line_opacity = 0.2,
  set_cursor = false,
  set_cursorline = true,
  set_number = false,
  ignore_filetypes = { "NvimTree", "TelescopePrompt" }
})
