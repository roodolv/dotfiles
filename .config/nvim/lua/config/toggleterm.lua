local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal
local opts = { silent = true, noremap = true }

local float_term_key = "<Leader>tf"
local bottom_term_key = "<Leader>tb"
local side_term_key = "<Leader>ts"

toggleterm.setup({
  persist_size = false,
})

-- terminal keymaps
function _G.set_terminal_keymaps()
  opts = { buffer = 0, noremap = true }
  vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<M-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<M-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<M-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<M-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- float terminal
local float_term = Terminal:new({
  direction = "float",
  on_open = function(term)
    -- forced to change the working dir for terminal
    -- This will solve the problem of not updating the directory when switching sessions.
    local cwd = vim.fn.getcwd()
    if cwd ~= term.dir then
      term:change_dir(cwd)
    end
    -- when float term opened, disable bottom terminal
    if bottom_term_key then
      opts = { silent = true, noremap = true }
      vim.keymap.del("t", bottom_term_key, opts)
    end
    vim.cmd("startinsert!")
  end,
  on_close = function(t, job, exit_code, name)
    -- when float term closed, enable bottom terminal
    opts = { silent = true, noremap = true, desc = "ToggleTerm bottom" }
    vim.keymap.set("t", bottom_term_key, "<C-\\><C-n>:lua _bottom_term_toggle()<CR>", opts)
  end,
})
function _float_term_toggle()
  float_term:toggle()
end

-- bottom terminal
local bottom_term = Terminal:new({
  direction = "horizontal",
  on_open = function(term)
    -- forced to change the working dir for terminal
    -- This will solve the problem of not updating the directory when switching sessions.
    local cwd = vim.fn.getcwd()
    if cwd ~= term.dir then
      term:change_dir(cwd)
    end
    vim.cmd("startinsert!")
  end,
  on_exit = function(t, job, exit_code, name)
    vim.cmd("quit!")
  end,
})
function _bottom_term_toggle()
  bottom_term:toggle()
end

-- side terminal
local side_term = Terminal:new({
  direction = "vertical",
  on_open = function(term)
    -- forced to change the working dir for terminal
    -- This will solve the problem of not updating the directory when switching sessions.
    local cwd = vim.fn.getcwd()
    if cwd ~= term.dir then
      term:change_dir(cwd)
    end
    vim.cmd("startinsert!")
  end,
  on_exit = function(t, job, exit_code, name)
    vim.cmd("quit!")
  end,
})
function _side_term_toggle()
  side_term:toggle()
end

-- custom terminals
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    opts.buffer = term.bufnr
    vim.keymap.set("n", "q", ":<C-u>close<CR>", opts)
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})
function _lazygit_toggle()
  lazygit:toggle()
end

-- keymaps
opts = { silent = true, noremap = true }
opts.desc = "ToggleTerm toggle"
vim.keymap.set("n", "<C-\\>", ":<C-u>ToggleTerm<CR>", opts)
opts.desc = "ToggleTerm toggle 1"
vim.keymap.set("n", "1<C-\\>", ":<C-u>1ToggleTerm<CR>", opts)
opts.desc = "ToggleTerm toggle 2"
vim.keymap.set("n", "2<C-\\>", ":<C-u>2ToggleTerm<CR>", opts)
opts.desc = "ToggleTerm toggle 3"
vim.keymap.set("n", "3<C-\\>", ":<C-u>3ToggleTerm<CR>", opts)
opts.desc = "ToggleTerm toggle 4"
vim.keymap.set("n", "4<C-\\>", ":<C-u>4ToggleTerm<CR>", opts)
opts.desc = "ToggleTerm toggle 5"
vim.keymap.set("n", "5<C-\\>", ":<C-u>5ToggleTerm<CR>", opts)
opts.desc = "ToggleTerm toggle 6"
vim.keymap.set("n", "6<C-\\>", ":<C-u>6ToggleTerm<CR>", opts)

opts.desc = "ToggleTerm select"
vim.keymap.set("n", "<Leader>tt", ":<C-u>TermSelect<CR>", opts)

opts.desc = "ToggleTerm float"
vim.keymap.set("n", float_term_key, ":lua _float_term_toggle()<CR>", opts)
opts.desc = "ToggleTerm float"
vim.keymap.set("t", float_term_key, "<C-\\><C-n>:lua _float_term_toggle()<CR>", opts)
opts.desc = "ToggleTerm bottom"
vim.keymap.set("n", bottom_term_key, ":lua _bottom_term_toggle()<CR>", opts)
opts.desc = "ToggleTerm bottom"
vim.keymap.set("t", bottom_term_key, "<C-\\><C-n>:lua _bottom_term_toggle()<CR>", opts)
opts.desc = "ToggleTerm side"
vim.keymap.set("n", side_term_key, ":lua _side_term_toggle()<CR>", opts)
opts.desc = "ToggleTerm side"
vim.keymap.set("t", side_term_key, "<C-\\><C-n>:lua _side_term_toggle()<CR>", opts)

opts.desc = "ToggleTerm LazyGit"
vim.api.nvim_set_keymap("n", "<Leader>tg", ":<C-u>lua _lazygit_toggle()<CR>", opts)
