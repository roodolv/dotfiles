local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- { { "A", "B" } } runs only the first available formatter
    lua = { "stylua" },
    rust = { "rustfmt" },
    python = { "ruff_fix", "ruff_format" },
    -- go = { "goimports", "gofmt" },
    javascript = { "biome", "prettierd" },
    typescript = { "biome", "prettierd" },
    javascriptreact = { "biome" },
    typescriptreact = { "biome" },
    astro = { "biome" },
    svelte = { "biome" },
    vue = { "biome" },
    json = { "biome" },
    jsonc = { "biome" },
    -- toml = { "undone" },
    yaml = { "prettierd" },
    html = { "prettierd" },
    css = { "prettierd" },
  },
  formatters = {
    ruff_fix = { args = { "--ignore-unused" } },
    biome = {
      args = {
        "format",
        "--stdin-file-path",
        "$FILENAME",
        "--indent-style",
        "space",
        "--line-ending",
        "lf",
      },
    },
  },
  format_on_save = function(bufnr)
    -- Disabled by default
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    -- Disabled on certain filetypes
    local ignore_filetypes = { "c", "cpp" }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end
    return { timeout_ms = 500, lsp_fallback = true }
  end,
})

-- Create commands to toggle format-on-save
vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

-- toggle commands
local function toggle_conform_auto_format()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    vim.cmd("FormatEnable")
    vim.api.nvim_echo({ { "conform: Auto-format enabled", "None" } }, true, {})
  else
    vim.cmd("FormatDisable")
    vim.api.nvim_echo({ { "conform: Auto-format disabled", "WarningMsg" } }, true, {})
  end
end

-- keymaps
local opts = { noremap = true, silent = true }

opts.desc, opts.silent = "Conform Toggle Auto-format", false
vim.keymap.set("n", "<Leader>ct", toggle_conform_auto_format, opts)
opts.desc = "Conform Info"
vim.keymap.set("n", "<Leader>ci", ":<C-u>ConformInfo<CR>", opts)
