vim.g.mkdp_filetypes = { "markdown" }

local opts = { silent = true, noremap = true }

opts.desc = "MarkdownPreview Toggle"
vim.keymap.set("n", "<Leader>M", ":<C-u>MarkdownPreviewToggle<CR>", opts)

local function get_hol_status(line)
  local hol = {}
  hol.current_line = line

  local blankline_pattern = "^$"
  hol.has_blankline = hol.current_line:match(blankline_pattern) ~= nil
  if hol.has_blankline then
    return hol
  end

  local quote_pattern = "^(%s*)(>%s)(.*)$"
  hol.before_quote, hol.quote, hol.after_quote = hol.current_line:match(quote_pattern)
  hol.has_quote = hol.quote ~= nil

  local indent_pattern = "^(%s*)(.*)$"
  hol.indent, hol.after_indent = hol.current_line:match(indent_pattern)
  hol.has_indent = hol.indent ~= nil

  return hol
end

local function get_target_status(line)
  local target = {}
  target.current_line = line

  local checkbox_pattern = "^(%s*)(-%s%[[ x]%]%s)(.*)$"
  target.before_check, target.checkbox, target.after_check = target.current_line:match(checkbox_pattern)

  local list_pattern = "^(%s*)(-%s)(.*)$"
  target.before_list, target.list, target.after_list = target.current_line:match(list_pattern)

  local indent_pattern = "^(%s*)(.*)$"
  target.indent, target.after_indent = target.current_line:match(indent_pattern)

  target.has_checkbox = target.checkbox ~= nil
  target.has_list = target.list ~= nil
  target.has_indent = target.indent ~= nil
  return target
end

--- @param vim_mode string "n" | "v" | "V" | etc
--- @param toggle_mode string "quote" | "checkbox" | "list"
--- @param current_line string
local function get_toggled_line(vim_mode, toggle_mode, current_line)
  local new_line
  local target
  local hol = get_hol_status(current_line)

  -- Set toggled-mark for toggle-mode
  local toggled_mark
  if toggle_mode == "quote" then
    toggled_mark = "> "
  elseif toggle_mode == "checkbox" then
    toggled_mark = "- [ ] "
  elseif toggle_mode == "list" then
    toggled_mark = "- "
  end

  -- In quote-mode, simply toggle quotations
  if toggle_mode == "quote" then
    if hol.has_quote then
      new_line = hol.before_quote .. hol.after_quote
    elseif hol.has_indent then
      new_line = hol.indent .. toggled_mark .. hol.after_indent
    else
      new_line = toggled_mark .. current_line
    end
    return new_line
  end

  -- No changes are made to a blankline in the vim-visual mode
  if hol.has_blankline and (vim_mode == "v" or vim_mode == "V") then
    return current_line
  end

  -- Separate a head-of-line quote mark from the rest
  if hol.has_quote then
    target = get_target_status(hol.after_quote)
  else
    target = get_target_status(current_line)
  end

  -- Toggle marks
  if target.has_checkbox then
    if toggle_mode == "checkbox" then
      toggled_mark = (target.checkbox == "- [x] " and "- [ ] " or "- [x] ")
    end
    new_line = target.before_check .. toggled_mark .. target.after_check
  elseif target.has_list then
    if toggle_mode == "list" then
      toggled_mark = ""
    end
    new_line = target.before_list .. toggled_mark .. target.after_list
  elseif target.has_indent then
    new_line = target.indent .. toggled_mark .. target.after_indent
  else
    new_line = toggled_mark .. target.current_line
  end

  -- Combine the quote mark with the line
  if hol.has_quote then
    new_line = hol.before_quote .. hol.quote .. new_line
  end

  return new_line
end

--- @param toggle_mode string "quote" | "checkbox" | "list"
local function toggle(toggle_mode)
  local vim_mode = vim.fn.mode()

  if vim_mode == "n" then
    local current_line = vim.api.nvim_get_current_line()
    local new_line = get_toggled_line(vim_mode, toggle_mode, current_line)
    vim.api.nvim_set_current_line(new_line)
  elseif vim_mode == "v" or vim_mode == "V" then
    local line_start = vim.fn.getpos("v")[2]
    local line_end = vim.fn.getpos(".")[2]

    if line_end < line_start then
      line_end = line_end - 1
      line_start, line_end = line_end, line_start
    else
      line_start = line_start - 1
    end

    local lines = vim.api.nvim_buf_get_lines(0, line_start, line_end, true)
    local replaced_lines = lines
    local something_toggled = false

    -- TODO: Check all lines at once and toggle all the HOL marks
    for i, line in ipairs(lines) do
      repeat
        replaced_lines[i] = get_toggled_line(vim_mode, toggle_mode, line)

      -- HACK: fix here like this:
      -- local hol = get_hol_status(line)
      -- local target
      -- if hol.has_blankline then
      --   break
      -- end
      -- if hol.has_quote then
      --   target = get_target_status(hol.after_quote)
      -- else
      --   target = get_target_status(line)
      -- end
      -- if target.has_checkbox or target.has_list then
      --   break
      -- else
      --   replaced_lines[i] = get_toggled_line(vim_mode, toggle_mode, hol, target)
      --   something_toggled = true
      -- end

      -- HACK: write bit-operations for toggle-checking like: 0b01 ~ 0b01
      until true
    end
    -- HACK: 2nd loop (if flag isn't set, all lines are toggled here)
    -- for i, line in ipairs(lines) do
    --   if something_toggled ~= true then
    --     replaced_lines[i] = get_toggled_line(vim_mode, toggle_mode, line)
    --   end
    -- end

    vim.api.nvim_buf_set_lines(0, line_start, line_end, true, replaced_lines)
  end
end

-- stylua: ignore
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "markdown.mdx" },
  callback = function()
    opts.buffer = true
    opts.desc = "Markdown ToggleQuote"
    vim.keymap.set({ "n", "x" }, "<C-q>", function() toggle("quote") end, opts)
    opts.desc = "Markdown ToggleCheckbox"
    vim.keymap.set({ "n", "x" }, "<C-x>", function() toggle("checkbox") end, opts)
    opts.desc = "Markdown ToggleList"
    vim.keymap.set({ "n", "x" }, "<C-l>", function() toggle("list") end, opts)
  end,
})
