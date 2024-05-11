-- setup telescope
local Telescope = require("telescope")

Telescope.setup({
  defaults = {
    vimgrep_arguments = { "rg", "-L", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
    prompt_prefix = "   ",
    selection_caret = " ",
    file_ignore_patterns = { "node_modules" },
    path_display = { "truncate" },
  },
})

-- load extensions
Telescope.load_extension("frecency")
