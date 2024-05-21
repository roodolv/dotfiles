local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup({
  defaults = {
    vimgrep_arguments = { "rg", "-L", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
    prompt_prefix = "   ",
    selection_caret = " ",
    file_ignore_patterns = { ".git/", "node_modules" },
    path_display = {
      filename_first = {
        reverse_directories = false
      }
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        -- height = function (_, _, max_lines) return max_lines end,
        height = 0.8,
        preview_cutoff = 0,
        preview_height = 10,
        prompt_position = "top",
      }
    },
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<M-t>"] = open_with_trouble,
        ["<M-S-t>"] = add_to_trouble,
      },
      n = {
        ["q"] = actions.close,
        ["<M-t>"] = open_with_trouble,
        ["<M-S-t>"] = add_to_trouble,
      },
    },
  },
  pickers = {
    git_files = {
      git_command = { "git", "ls-files", "--exclude-standard", "--cached", "--others" },
    },
  },
})

vim.keymap.set("n", "<Leader>ff", ":<C-u>Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git<CR>",
  { silent = true, desc = "List project files" })
vim.keymap.set("n", "<Leader>fg", ":<C-u>Telescope live_grep<CR>", { silent = true, desc = "Live Grep" })
vim.keymap.set("n", "<Leader>fG", ":<C-u>Telescope git_files<CR>", { silent = true, desc = "List git_files" })
vim.keymap.set("n", "<Leader>fl", ":<C-u>Telescope current_buffer_fuzzy_find<CR>",
  { silent = true, desc = "Current buffer fuzzy find" })
vim.keymap.set("n", "<Leader>fj", function()
  local jumplist = vim.fn.getjumplist()
  builtin.jumplist({
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
vim.keymap.set("n", "<Leader>fd", ":<C-u>Telescope diagnostics<CR>", { silent = true, desc = "List diagnostics" })
vim.keymap.set("n", "<Leader>fq", ":<C-u>Telescope quickfix<CR>", { silent = true, desc = "List QuickFix" })
vim.keymap.set("n", "<Leader>fm", ":<C-u>Telescope marks<CR>", { silent = true, desc = "List Marks" })
vim.keymap.set("n", "<Leader>fk", ":<C-u>Telescope keymaps<CR>", { silent = true, desc = "List keymaps" })
vim.keymap.set("n", "<Leader>hh", ":<C-u>Telescope harpoon marks<CR>", { silent = true, desc = "List harpoon-marks" })
vim.keymap.set("n", "<Leader>fp", function() require("telescope").extensions.frecency.frecency { workspace = "CWD", } end,
  { silent = true, desc = "List prioritized by frecency" })
vim.keymap.set("n", "<Leader>rr", function() require("telescope").extensions.refactoring.refactors() end,
  { silent = true, desc = "List refactoring methods" })
vim.keymap.set("x", "<Leader>rr", function() require("telescope").extensions.refactoring.refactors() end,
  { silent = true, desc = "List refactoring methods" })

-- load extensions
telescope.load_extension("frecency")
telescope.load_extension("refactoring")
