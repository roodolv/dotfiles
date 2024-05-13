local Flash = require("flash")

-- Flash.jump
vim.keymap.set({"n", "x", "o"}, "s", function()
  Flash.jump()
  -- NOTE: match beginning of words only
  -- Flash.jump({
  --   search = { mode = function(str)
  --     return "\\<" .. str
  --   end, },
  -- })
end, {silent = true, desc = "Flash.jump(normal)"})

-- Flash.jump(diagnostics without changing cursor position)
vim.keymap.set({"n", "x", "o"}, "<Leader>s", function()
  Flash.jump({
    matcher = function(win)
      ---@param diag Diagnostic
      return vim.tbl_map(function(diag)
        return {
          pos = { diag.lnum + 1, diag.col },
          end_pos = { diag.end_lnum + 1, diag.end_col - 1 },
        }
      end, vim.diagnostic.get(vim.api.nvim_win_get_buf(win)))
    end,
    action = function(match, state)
      vim.api.nvim_win_call(match.win, function()
        vim.api.nvim_win_set_cursor(match.win, match.pos)
        vim.diagnostic.open_float()
      end)
      state:restore()
    end,
  })
end, {silent = true, desc = "Flash.jump(diagnostics)"})

-- Flash.jump(jump to a line)
vim.keymap.set({"n", "x", "o"}, "<Leader>l", function()
  require("flash").jump({
    search = { mode = "search", max_length = 0 },
    label = { after = { 0, 0 } },
    pattern = "^"
  })
end, {silent = true, desc = "Flash.jump(line)"})

vim.keymap.set({"n", "x", "o"}, "S", function() Flash.treesitter() end, {silent = true, desc = "Flash.treesitter"})
vim.keymap.set({"o"}, "r", function() Flash.remote() end, {silent = true, desc = "Flash.remote"})
vim.keymap.set({"o", "x"}, "R", function() Flash.treesitter_search() end, {silent = true, desc = "Flash.treesitter_search"})
vim.keymap.set({"c"}, "<C-s>", function() Flash.toggle() end, {silent = true, desc = "Flash.toggle"})
