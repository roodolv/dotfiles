local obsidian = require("obsidian")

obsidian.setup({
  workspaces = {
    {
      name = "main",
      path = "E:/Obsidian/main",
    },
    {
      name = "myblog",
      path = os.getenv("DEV_PROJ") .. "/Hugo/myblog",
      overrides = {
        notes_subdir = "content/posts/drafts",
        new_notes_location = "notes_subdir",
        daily_notes = {
          folder = "content/posts/drafts",
          date_format = "%Y-%m-%d_%H.%M.%S_",
          template = "archetypes/nvim_obsidian_default.md",
        },
        templates = {
          folder = "archetypes",
          substitutions = {
            date_hugo_slug = function()
              return os.date("%Y/%m/")
            end,
            time_colon = function()
              return os.date("%H:%M:%S")
            end,
          },
        },
        attachments = {
          img_folder = "content/posts/drafts/img",
        },
      },
    },
  },
  notes_subdir = "default",
  new_notes_location = "notes_subdir",
  disable_frontmatter = true,
  -- preferred_link_style = "wiki", -- "wiki" | "markdown
  daily_notes = {
    folder = "daily/" .. os.date("%Y"),
    date_format = "daily_%Y-%m-%d",
    template = "template/nvim/daily_task.md",
  },
  templates = {
    folder = "template",
    date_format = "%Y-%m-%d",
    time_format = "%H.%M.%S",
    substitutions = {
      date_ymd = function()
        return os.date("%y/%m/%d")
      end,
      date_ymd_wday = function()
        local wdays = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" }
        local wday_str = wdays[os.date("*t", os.time()).wday]
        return os.date("%y/%m/%d") .. "(" .. wday_str .. ")"
      end,
    },
  },
  attachments = {
    img_folder = "resource",
  },
})

local opts = { silent = true, noremap = true }

-- search & browse
opts.desc = "Obsidian Open WorkSpace"
vim.keymap.set("n", "<Leader>ow", ":<C-u>ObsidianWorkspace<CR>", opts)
opts.desc = "Obsidian Search"
vim.keymap.set("n", "<Leader>os", ":<C-u>ObsidianSearch<CR>", opts)
vim.keymap.set("n", "<Leader>fo", ":<C-u>ObsidianSearch<CR>", opts)
opts.desc = "Obsidian Tag"
vim.keymap.set("n", "<Leader>ot", ":<C-u>ObsidianTags<CR>", opts)
opts.desc = "Obsidian Dailies"
vim.keymap.set("n", "<Leader>od", ":<C-u>ObsidianDailies<CR>", opts)
opts.desc = "Obsidian Backlinks"
vim.keymap.set("n", "<Leader>ob", ":<C-u>ObsidianBacklinks<CR>", opts)

-- daily notes
opts.desc = "Obsidian Yesterday"
vim.keymap.set("n", "<Leader>o<", ":<C-u>ObsidianYesterday<CR>", opts)
opts.desc = "Obsidian Today"
vim.keymap.set("n", "<Leader>o.", ":<C-u>ObsidianToday<CR>", opts)
opts.desc = "Obsidian Tomorrow"
vim.keymap.set("n", "<Leader>o>", ":<C-u>ObsidianTomorrow<CR>", opts)

-- editing
opts.desc = "Obsidian New"
vim.keymap.set("n", "<Leader>oN", ":<C-u>ObsidianNew<CR>", opts)
opts.desc = "Obsidian Template"
vim.keymap.set("n", "<Leader>oT", ":<C-u>ObsidianTemplate<CR>", opts)
opts.desc = "Obsidian PasteImg"
vim.keymap.set("n", "<Leader>oI", ":<C-u>ObsidianPasteImg<CR>", opts)

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
    opts.desc = "Obsidian ToggleQuote"
    vim.keymap.set("n", "<C-q>", toggle_quote, opts)
    opts.desc = "Obsidian ToggleCheckbox"
    vim.keymap.set("n", "<C-x>", toggle_checkbox, opts)
    opts.desc = "Obsidian ToggleList"
    vim.keymap.set("n", "<C-l>", toggle_list, opts)
  end,
})
