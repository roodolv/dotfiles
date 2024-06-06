require("todo-comments").setup({
  keywords = {
    FIX = {
      icon = "",                                  -- icon used for the sign, and in search results
      color = "error",                            -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = "", color = "info" },
    HACK = { icon = "", color = "warning" },
    WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "", color = "hint", alt = { "INFO", "MEMO" } },
    TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    REVW = { icon = "", color = "review", alt = { "REVIEW", "NOTICE" } },
  },
  merge_keywords = true,             -- when true, custom keywords will be merged with the defaults
  highlight = {
    before = "",                     -- "fg" or "bg" or empty
    keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg",                    -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    exclude = {},                    -- list of file types to exclude highlighting
  },
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" },
    review = { "Identifier", "#777788" }
  },
})

-- keymaps
local opts = { silent = true, noremap = true }
-- vim.keymap.set("n", "<Leader>tt", ":<C-u>TodoTelescope<CR>", opts)
vim.keymap.set("n", "<Leader>tQ", ":<C-u>TodoQuickFix<CR>", opts)
