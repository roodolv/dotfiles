local crates = require("crates")

crates.setup({
  -- smart_insert = true,
  -- insert_closing_quote = true,
  -- avoid_prerelease = true,
  -- autoload = true,
  -- autoupdate = true,
  -- autoupdate_throttle = 250,
  -- loading_indicator = true,
  -- date_format = "%Y-%m-%d",
  -- thousands_separator = ".",
  -- notification_title = "Crates",
  -- curl_args = { "-sL", "--retry", "1" },
  -- max_parallel_requests = 80,
  -- open_programs = { "xdg-open", "open" },
  -- disable_invalid_feature_diagnostic = false,
  -- text = {
  --   loading = "   Loading",
  --   version = "   %s",
  --   prerelease = "   %s",
  --   yanked = "   %s",
  --   nomatch = "   No match",
  --   upgrade = "   %s",
  --   error = "   Error fetching crate",
  -- },
  -- highlight = {
  --   loading = "CratesNvimLoading",
  --   version = "CratesNvimVersion",
  --   prerelease = "CratesNvimPreRelease",
  --   yanked = "CratesNvimYanked",
  --   nomatch = "CratesNvimNoMatch",
  --   upgrade = "CratesNvimUpgrade",
  --   error = "CratesNvimError",
  -- },
  -- popup = {
  --   autofocus = false,
  --   hide_on_select = false,
  --   copy_register = '"',
  --   style = "minimal",
  --   border = "none",
  --   show_version_date = false,
  --   show_dependency_version = true,
  --   max_height = 30,
  --   min_width = 20,
  --   padding = 1,
  --   keys = {
  --     hide = { "q", "<esc>" },
  --     open_url = { "<cr>" },
  --     select = { "<cr>" },
  --     select_alt = { "s" },
  --     toggle_feature = { "<cr>" },
  --     copy_value = { "yy" },
  --     goto_item = { "gd", "K", "<C-LeftMouse>" },
  --     jump_forward = { "<c-i>" },
  --     jump_back = { "<c-o>", "<C-RightMouse>" },
  --   },
  -- },
})

-- integration with NativeLSP
local function show_documentation()
  if vim.fn.expand("%:t") == "Cargo.toml" and crates.popup_available() then
    crates.show_popup()
  else
    vim.lsp.buf.hover()
  end
end

-- set autocmd
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  pattern = "Cargo.toml",
  callback = function(args)
    local opts = { buffer = args.buf, silent = true }

    vim.keymap.set("n", "<Leader>ct", crates.toggle, opts)
    vim.keymap.set("n", "<Leader>cr", crates.reload, opts)

    vim.keymap.set("n", "<Leader>cv", crates.show_versions_popup, opts)
    vim.keymap.set("n", "<Leader>cf", crates.show_features_popup, opts)
    vim.keymap.set("n", "<Leader>cd", crates.show_dependencies_popup, opts)

    vim.keymap.set("n", "<Leader>cu", crates.update_crate, opts)
    vim.keymap.set("v", "<Leader>cu", crates.update_crates, opts)
    vim.keymap.set("n", "<Leader>ca", crates.update_all_crates, opts)
    vim.keymap.set("n", "<Leader>cU", crates.upgrade_crate, opts)
    vim.keymap.set("v", "<Leader>cU", crates.upgrade_crates, opts)
    vim.keymap.set("n", "<Leader>cA", crates.upgrade_all_crates, opts)

    vim.keymap.set("n", "<Leader>cx", crates.expand_plain_crate_to_inline_table, opts)
    vim.keymap.set("n", "<Leader>cX", crates.extract_crate_into_table, opts)

    vim.keymap.set("n", "<Leader>cH", crates.open_homepage, opts)
    vim.keymap.set("n", "<Leader>cR", crates.open_repository, opts)
    vim.keymap.set("n", "<Leader>cD", crates.open_documentation, opts)
    vim.keymap.set("n", "<Leader>cC", crates.open_crates_io, opts)

    vim.keymap.set("n", "K", show_documentation, opts)
  end,
})
