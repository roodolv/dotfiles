local flash = require("flash")
flash.setup({
  modes = {
    search = { enabled = true },
  }
})

local opts = { silent = true }

-- flash.jump
opts.desc = "flash.jump(normal)"
vim.keymap.set({ "n", "x", "o" }, "s", function()
  flash.jump()
  -- NOTE: match beginning of words only
  -- flash.jump({
  --   search = { mode = function(str)
  --     return "\\<" .. str
  --   end, },
  -- })
end, opts)

-- diagnostics without changing cursor position
opts.desc = "flash.jump(diagnostics)"
vim.keymap.set({ "n", "x", "o" }, "<Leader>s", function()
  flash.jump({
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
end, opts)

-- opts.desc = "flash.treesitter"
-- vim.keymap.set({"n", "x", "o"}, "S", function() flash.treesitter() end, opts)
-- opts.desc = "flash.remote"
-- vim.keymap.set({"o"}, "r", function() flash.remote() end, opts)
-- opts.desc = "flash.treesitter_search"
-- vim.keymap.set({"o", "x"}, "R", function() flash.treesitter_search() end, opts)
opts.desc = "flash.toggle"
vim.keymap.set({ "c" }, "<C-s>", function() flash.toggle() end, opts)
