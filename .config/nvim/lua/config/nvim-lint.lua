local lint = require("lint")

lint.linters_by_ft = ({
  -- python = { "ruff" },
  -- javascript = { "biomejs", },
  -- typescript = { "biomejs", },
  -- javascriptreact = { "biomejs", }
  -- typescriptreact = { "biomejs", },
  -- markdown = { "vale", }
})

-- require("lint").linters.your_linter_name = {
--   cmd = "linter_cmd",
--   stdin = true,
--   append_fname = true,
--   args = {},
--   stream = nil, -- "stdout" | "stderr" | "both"
--   ignore_exitcode = false,
--   env = nil,
--   parser = function() end -- your_parse_function
-- }

lint.setup({
})

-- -- auto-linting by linter setup on "linters_by_ft"
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--     require("lint").try_lint()
--   end,
-- })

-- -- auto-linting by linter for respective filetypes
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   pattern = { "*.c", "*.cpp" },
--   callback = function()
--     require("lint").try_lint("cspell")
--   end,
-- })
