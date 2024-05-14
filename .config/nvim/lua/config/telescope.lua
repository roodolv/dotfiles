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

vim.keymap.set("n", "<Leader>ff", ":<C-u>Telescope find_files<CR>", { silent = true, desc = "List project files" })
vim.keymap.set("n", "<Leader>fg", ":<C-u>Telescope live_grep<CR>", { silent = true, desc = "Live Grep" })
vim.keymap.set("n", "<Leader>fG", ":<C-u>Telescope git_files<CR>", { silent = true, desc = "List git_files" })
vim.keymap.set("n", "<Leader>fl", ":<C-u>Telescope current_buffer_fuzzy_find<CR>", { silent = true, desc = "Current buffer fuzzy find" })
vim.keymap.set("n", "<Leader>fj", function()
  local jumplist = vim.fn.getjumplist()
  require("telescope.builtin").jumplist({
    on_complete = {
      function(self)
        -- select current
        local n = #jumplist[1]
        if n ~= jumplist[2] then
          self:move_selection(jumplist[2] - #jumplist[1] + 1)
        end
      end,
    },
  })
  end, { silent = true, desc = "List jumplist" }
)
vim.keymap.set("n", "<Leader>fb", ":<C-u>Telescope buffers<CR>", { silent = true, desc = "List buffers" })
vim.keymap.set("n", "<Leader>fr", ":<C-u>Telescope oldfiles<CR>", { silent = true, desc = "List recent files" })
vim.keymap.set("n", "<Leader>fh", ":<C-u>Telescope help_tags<CR>", { silent = true, desc = "List help-tags" })
vim.keymap.set("n", "<Leader>fc", ":<C-u>Telescope commands<CR>", { silent = true, desc = "List commands" })
vim.keymap.set("n", "<Leader>f:", ":<C-u>Telescope command_history<CR>", { silent = true, desc = "List command history" })
vim.keymap.set("n", "<Leader>fm", ":<C-u>Telescope keymaps<CR>", { silent = true, desc = "List keymaps" })
vim.keymap.set("n", "<Leader>fp", function() require("telescope").extensions.frecency.frecency { workspace = "CWD", } end, { silent = true, desc = "List prioritized by frecency" })
vim.keymap.set("n", "<Leader>rr", function() require("telescope").extensions.refactoring.refactors() end, { silent = true, desc = "List refactoring methods" })
vim.keymap.set("x", "<Leader>rr", function() require("telescope").extensions.refactoring.refactors() end, { silent = true, desc = "List refactoring methods" })
-- vim.keymap.set("n", "<Leader>fs", function() require("telescope").extensions.smart_open.smart_open() end, { silent = true, desc = "List smart-open" })

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
