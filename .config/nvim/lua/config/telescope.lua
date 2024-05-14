-- setup telescope
local Telescope = require("telescope")
local actions = require("telescope.actions")

Telescope.setup({
  defaults = {
    vimgrep_arguments = { "rg", "-L", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
    prompt_prefix = "   ",
    selection_caret = " ",
    file_ignore_patterns = { "node_modules" },
    path_display = { "truncate" },
    -- custom layout
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        height = function (_, _, max_lines) return max_lines end,
        preview_cutoff = 0,
        preview_height = 10,
      }
    },
    -- custom keymaps
    mappings = {
        i = { ["<Esc>"] = actions.close },
        n = { ["q"] = actions.close },
    },
  },
  pickers = {
    git_files = {
      git_command = {"git", "ls-files", "--exclude-standard", "--cached", "--others"},
    },
  },
})

-- setup sqlite3 path for smart-open.nvim
-- local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
-- if is_windows then
--   local home = os.getenv("USERPROFILE")
--   vim.g.sqlite_clib_path = home .. "\\lib\\sqlite3.dll"
-- else
--   vim.g.sqlite_clib_path = "/usr/lib/x86_64-linux-gnu/libsqlite3.so"
-- end

-- load extensions
Telescope.load_extension("frecency")
Telescope.load_extension("refactoring")
-- Telescope.load_extension("smart_open")
