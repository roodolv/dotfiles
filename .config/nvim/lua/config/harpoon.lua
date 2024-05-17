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
vim.keymap.set("n", "<Leader>hx", function() harpoon:list():add() end, {desc = "Harpoon add"})
vim.keymap.set("n", "<C-Down>", function() harpoon:list():next() end, {desc = "Harpoon next"})
vim.keymap.set("n", "<C-Up>", function() harpoon:list():prev() end, {desc = "Harpoon prev"})
vim.keymap.set("n", "<Leader>h1", function() harpoon:list():select(1) end, {desc = "Harpoon select(1)"})
vim.keymap.set("n", "<Leader>h2", function() harpoon:list():select(2) end, {desc = "Harpoon select(2)"})
vim.keymap.set("n", "<Leader>h3", function() harpoon:list():select(3) end, {desc = "Harpoon select(3)"})
vim.keymap.set("n", "<Leader>h4", function() harpoon:list():select(4) end, {desc = "Harpoon select(4)"})

local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
if is_windows then
  -- default harpoon UI
  vim.keymap.set("n", "<Leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "Harpoon toggle"})
else
  -- use Telescope as a UI
  vim.keymap.set("n", "<Leader>ht", function() toggle_telescope(harpoon:list()) end,
    { desc = "Telescope harpoon list" })
end
