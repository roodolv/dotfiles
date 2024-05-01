-- Options
vim.g.startify_files_number = 5
vim.g.startify_session_number = 15
vim.g.startify_change_to_dir = 1
vim.g.startify_change_to_vcs_root = 1

-- Mappings
vim.api.nvim_set_keymap('n', '<Leader><Leader><Space>', ':Startify<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Space>s', ':SSave!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Space>l', ':SLoad<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Space>c', ':SClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Space>dd', ':SDelete<CR>', { noremap = true, silent = true })

-- Lists on startup
vim.g.startify_lists = {
  {['type'] = 'files', ['header'] = {'Recently Used:'}},
  {['type'] = 'dir', ['header'] = {'Recently Used (CurrentDir):'}},
  {['type'] = 'sessions', ['header'] = {'Sessions:'}},
  {['type'] = 'bookmarks', ['header'] = {'Bookmarks:'}},
}

-- Bookmark setting
vim.g.startify_bookmarks = {
  "~/.config/nvim/init.lua",
  "~/.config/nvim/lua/plugins.lua",
}

-- Welcome page's message
local function filter_header(lines)
  local longest_line = 0
  for _, line in ipairs(lines) do
    longest_line = math.max(longest_line, #line)
  end
  local centered_lines = {}
  for _, line in ipairs(lines) do
    local padding = string.rep(" ", (vim.api.nvim_get_option("columns") / 2) - (longest_line / 2))
    table.insert(centered_lines, padding .. line)
  end
  return centered_lines
end

vim.g.startify_custom_header = filter_header({"<<Neovim>>"})
