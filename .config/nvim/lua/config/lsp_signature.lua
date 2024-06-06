local signature = require("lsp_signature")

local cfg = {
  floating_window_off_x = 5,
  floating_window_off_y = function()
    local linenr = vim.api.nvim_win_get_cursor(0)[1]
    local pumheight = vim.o.pumheight
    local winline = vim.fn.winline()
    local winheight = vim.fn.winheight(0)

    -- window top
    if winline - 1 < pumheight then
      return pumheight
    end

    -- window bottom
    if winheight - winline < pumheight then
      return -pumheight
    end
    return 0
  end,
  transparency = 20,
}
signature.setup(cfg)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    signature.on_attach({
      bind = true,
      floating_window = false,
      hint_prefix = "",
      hint_scheme = "Comment",
    }, bufnr)
  end,
})

vim.keymap.set({ "n" }, "<C-k>", function()
  require("lsp_signature").toggle_float_win()
end, { silent = true, noremap = true, desc = "toggle signature" })

-- vim.keymap.set({ "n" }, "<C-k>", function()
--   vim.lsp.buf.signature_help()
-- end, { silent = true, noremap = true, desc = "toggle signature" })
