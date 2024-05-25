local gitsigns = require('gitsigns')

gitsigns.setup {
  signs = {
    -- add          = { text = '┃' },
    add          = { text = '+' },
    change       = { text = '┃' },
    -- delete       = { text = '_' },
    delete       = { text = '-' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 300,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach = function(bufnr)
    local keymap = vim.keymap

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      keymap.set(mode, l, r, opts)
    end

    ----- Navigation
    map('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    local opts = {}

    ----- git hunk actions
    opts.desc = "gitsigns stage_hunk"
    keymap.set('n', '<leader>ghs', gitsigns.stage_hunk, opts)
    keymap.set('v', '<leader>ghs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, opts)
    opts.desc = "gitsigns stage_buffer"
    keymap.set('n', '<leader>ghS', gitsigns.stage_buffer, opts)

    opts.desc = "gitsigns undo_stage_hunk"
    keymap.set('n', '<leader>ghu', gitsigns.undo_stage_hunk, opts)

    opts.desc = "gitsigns reset_hunk"
    keymap.set('n', '<leader>ghr', gitsigns.reset_hunk, opts)
    keymap.set('v', '<leader>ghr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, opts)
    opts.desc = "gitsigns reset_buffer"
    keymap.set('n', '<leader>ghR', gitsigns.reset_buffer, opts)

    opts.desc = "gitsigns preview_hunk"
    keymap.set('n', '<leader>ghp', gitsigns.preview_hunk, opts)

    ----- git blame
    opts.desc = "gitsigns blame_line"
    keymap.set('n', '<leader>gb', function() gitsigns.blame_line{full=true} end, opts)
    opts.desc = "gitsigns toggle_current_line_blame"
    keymap.set('n', '<leader>gB', gitsigns.toggle_current_line_blame, opts)

    ----- git diff
    -- opts.desc = "gitsigns diffthis"
    -- keymap.set('n', '<leader>gd', gitsigns.diffthis, opts)
    -- opts.desc = "gitsigns diffthis to HEAD~"
    -- keymap.set('n', '<leader>gD', function() gitsigns.diffthis('~') end, opts)

    opts.desc = "gitsigns toggle_deleted"
    keymap.set('n', '<leader>g-', gitsigns.toggle_deleted, opts)

    ----- Text object
    opts.desc = "gitsigns select_hunk"
    keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
  end
}
