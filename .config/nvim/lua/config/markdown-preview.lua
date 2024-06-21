vim.g.mkdp_filetypes = { "markdown" }

local opts = { silent = true, noremap = true }

opts.desc = "MarkdownPreview Toggle"
vim.keymap.set("n", "<Leader>M", ":<C-u>MarkdownPreviewToggle<CR>", opts)

local function get_hol_status(line)
  local M = {}
  M.current_line = line

  local quote_pattern = "^(%s*)(>%s)(.*)$"
  M.before_quote, M.quote, M.after_quote = M.current_line:match(quote_pattern)

  local indent_pattern = "^(%s*)(.*)$"
  M.indent, M.after_indent = M.current_line:match(indent_pattern)

  M.has_quote = M.quote ~= nil
  M.has_indent = M.indent ~= nil
  return M
end

local function get_target_status(line)
  local M = {}
  M.current_line = line

  local checkbox_pattern = "^(%s*)(-%s%[[ x]%]%s)(.*)$"
  M.before_check, M.checkbox, M.after_check = M.current_line:match(checkbox_pattern)

  local list_pattern = "^(%s*)(-%s)(.*)$"
  M.before_list, M.list, M.after_list = M.current_line:match(list_pattern)

  local indent_pattern = "^(%s*)(.*)$"
  M.indent, M.after_indent = M.current_line:match(indent_pattern)

  M.has_checkbox = M.checkbox ~= nil
  M.has_list = M.list ~= nil
  M.has_indent = M.indent ~= nil
  return M
end

local function toggle_quote()
  local current_line = vim.api.nvim_get_current_line()
  local new_line
  local hol = get_hol_status(current_line)

  if hol.has_quote then
    new_line = hol.before_quote .. hol.after_quote
  elseif hol.has_indent then
    new_line = hol.indent .. "> " .. hol.after_indent
  else
    new_line = "> " .. current_line
  end

  vim.api.nvim_set_current_line(new_line)
end

local function toggle_checkbox()
  local current_line = vim.api.nvim_get_current_line()
  local new_line
  local hol = get_hol_status(current_line)
  local target

  if hol.has_quote then
    target = get_target_status(hol.after_quote)
  else
    target = get_target_status(current_line)
  end

  if target.has_checkbox then
    local updated_checkbox = (target.checkbox == "- [x] " and "- [ ] " or "- [x] ")
    new_line = target.before_check .. updated_checkbox .. target.after_check
  elseif target.has_list then
    new_line = target.before_list .. "- [ ] " .. target.after_list
  elseif target.has_indent then
    new_line = target.indent .. "- [ ] " .. target.after_indent
  else
    new_line = "- [ ] " .. target.current_line
  end

  if hol.has_quote then
    new_line = hol.before_quote .. hol.quote .. new_line
  end

  vim.api.nvim_set_current_line(new_line)
end

local function toggle_list()
  local current_line = vim.api.nvim_get_current_line()
  local new_line
  local hol = get_hol_status(current_line)
  local target

  if hol.has_quote then
    target = get_target_status(hol.after_quote)
  else
    target = get_target_status(current_line)
  end

  if target.has_checkbox then
    new_line = target.before_check .. "- " .. target.after_check
  elseif target.has_list then
    new_line = target.before_list .. target.after_list
  elseif target.has_indent then
    new_line = target.indent .. "- " .. target.after_indent
  else
    new_line = "- " .. target.current_line
  end

  if hol.has_quote then
    new_line = hol.before_quote .. hol.quote .. new_line
  end

  vim.api.nvim_set_current_line(new_line)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function()
    opts.buffer = true
    opts.desc = "Markdown ToggleQuote"
    vim.keymap.set("n", "<C-q>", toggle_quote, opts)
    opts.desc = "Markdown ToggleCheckbox"
    vim.keymap.set("n", "<C-x>", toggle_checkbox, opts)
    opts.desc = "Markdown ToggleList"
    vim.keymap.set("n", "<C-l>", toggle_list, opts)
  end,
})
