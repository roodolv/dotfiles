require("todo-comments").setup({
  keywords = {
    TODO = { icon = "", color = "todo" },
    FIXME = { icon = "", color = "fixme", alt = { "BUG", "ERROR", "FIX", "FIXIT", "ISSUE" } },
    XXX = { icon = "", color = "xxx", alt = { "XXX" } },
    WARN = { icon = "", color = "warn", alt = { "WARNING" } },
    HACK = { icon = "", color = "hack", alt = { "HACKING", "REFACTORING", "REFACTOR", "REFACT", "RFCT" } },
    OPTM = { icon = "", color = "optimize", alt = { "OPTIM", "OPTIMIZE", "PERF", "PERFORMANCE" } },
    REVW = { icon = "", color = "review", alt = { "REVIEW" } },
    NOTE = { icon = "", color = "note", alt = { "INFO", "MEMO", "NOTICE" } },
    TEST = { icon = "", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  merge_keywords = false, -- when true, custom keywords will be merged with the defaults
  highlight = {
    before = "", -- "fg" | "bg" | empty
    keyword = "wide_bg", -- "fg" | "bg" | "wide" | "wide_bg" | "wide_fg" | empty
    after = "fg",
    pattern = [[.*<(KEYWORDS)\s*:]],
    exclude = { "oil" }, -- list of file types to exclude highlighting
  },
  colors = {
    todo = { "#55DD55" },
    fixme = { "#CC1111" },
    xxx = { "#FF8099" },
    warn = { "#FFFF03" },
    hack = { "#3377ff" },
    optimize = { "#FFFFFF" },
    review = { "#AAAAFF" },
    note = { "#DDB0DD" },
    test = { "#777799" },
  },
})

-- keymaps
local opts = { silent = true, noremap = true }
-- vim.keymap.set("n", "<Leader>tt", ":<C-u>TodoTelescope<CR>", opts)
vim.keymap.set("n", "<Leader>tQ", ":<C-u>TodoQuickFix<CR>", opts)
