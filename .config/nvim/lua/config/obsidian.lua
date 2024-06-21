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
  follow_url_func = function(url)
    if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
      vim.fn.jobstart({ "explorer", url })
    elseif vim.fn.has("mac") == 1 then
      vim.fn.jobstart({ "open", url })
    elseif vim.fn.has("linux") == 1 then
      vim.fn.jobstart({ "xdg-open", url })
    elseif vim.fn.has("wsl") == 1 then
      vim.fn.jobstart({ "/mnt/c/Windows/System32/rundll32.exe", "url.dll,FileProtocolHandler", url })
    end
  end,
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
vim.keymap.set("n", "<Leader>fO", ":<C-u>ObsidianDailies<CR>", opts)
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
