local harpoon = require("harpoon")
harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

-- keymaps
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
vim.keymap.set("n", "hx", function() harpoon:list():add() end)
vim.keymap.set("n", "hn", function() harpoon:list():next() end)
vim.keymap.set("n", "hp", function() harpoon:list():prev() end)
if is_windows then
  -- default harpoon UI
  vim.keymap.set("n", "ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
else
  -- use Telescope as a UI
  vim.keymap.set("n", "ht", function() toggle_telescope(harpoon:list()) end,
    { desc = "Telescope harpoon list" })
end
