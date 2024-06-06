local lint = require("lint")
local linters = lint.linters

for _, linter in ipairs(linters) do
  local ns = lint.get_namespace(linter)
  vim.diagnostic.config({ virtual_text = true }, ns)
end

lint.linters_by_ft = {
  -- python = { "ruff" },
  -- javascript = { "biomejs" },
  -- typescript = { "biomejs" },
  -- javascriptreact = { "biomejs" },
  -- typescriptreact = { "biomejs" },
  -- -- setup linters on local
  -- lua = { "luacheck" },
  -- sh = { "shellcheck" },
  -- sql = { "sqlfluff" },
  -- tex = { "chktex" },
  -- yaml = { "yamllint" },
  -- markdown = { "markdownlint", "vale" },
}

-- linters.ruff = {
--   cmd = "linter_cmd",
--   stdin = true,
--   append_fname = true,
--   args = {},
--   stream = nil, -- "stdout" | "stderr" | "both"
--   ignore_exitcode = false,
--   env = nil,
--   parser = function() end, -- your_parse_function
-- }

---- Python(ruff)
local ruff_severities = {
  ["E"] = vim.diagnostic.severity.ERROR,
  ["F8"] = vim.diagnostic.severity.ERROR,
  ["F"] = vim.diagnostic.severity.WARN,
  ["W"] = vim.diagnostic.severity.WARN,
  ["D"] = vim.diagnostic.severity.INFO,
  ["B"] = vim.diagnostic.severity.INFO,
}
local ruff_parser = linters.ruff.parser
linters.ruff.parser = function(output, bufnr)
  local diagnostics = ruff_parser(output, bufnr)
  for _, v in pairs(diagnostics) do
    local code = string.sub(v.code, 1, 2)
    if code ~= "F8" then
      code = string.sub(code, 1, 1)
    end
    local new_severity = ruff_severities[code]
    if new_severity then
      v.severity = new_severity
    end
  end
  return diagnostics
end

-- auto-linting by linter setup on "linters_by_ft"
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedI", "BufRead", "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})

-- -- auto-linting by linter for respective filetypes
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedI", "BufRead", "BufWritePost" }, {
--   pattern = { "*.c", "*.cpp" },
--   callback = function()
--     lint.try_lint("cspell")
--   end,
-- })

-- Create commands
vim.api.nvim_create_user_command("LinterInfo", function()
  local runningLinters = table.concat(lint.get_running(), "\n")
  vim.notify(runningLinters, vim.log.levels.INFO, { title = "nvim-lint" })
end, {})

-- local lint_progress = function()
--   local linters = lint.get_running()
--   if #linters == 0 then
--     return "󰦕"
--   end
--   return "󱉶 " .. table.concat(linters, ", ")
-- end

-- keymaps
local opts = { noremap = true, silent = true }

opts.desc = "Linter Info"
vim.keymap.set("n", "<Leader>lI", ":<C-u>LinterInfo<CR>", opts)
