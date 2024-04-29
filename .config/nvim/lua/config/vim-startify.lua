-- Options
vim.g.startify_files_number = 5
vim.g.startify_session_number = 15
vim.g.startify_change_to_dir = 1
vim.g.startify_change_to_vcs_root = 1

-- Mappings
vim.api.nvim_set_keymap('n', '<Leader><Leader><Space>', ':Startify<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><Space>s', ':SSave<CR>', { noremap = true, silent = true })
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
vim.cmd([[
function! s:filter_header(lines) abort
  let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction

let g:startify_custom_header = s:filter_header([
      \ '<<Neovim>>',
      \ ])
]])
