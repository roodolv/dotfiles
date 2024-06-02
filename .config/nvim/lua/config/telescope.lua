local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local previewers = require("telescope.previewers")
local ext = telescope.extensions

local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = " ",
    file_ignore_patterns = { ".git/", "node_modules" },
    path_display = {
      filename_first = {
        reverse_directories = false,
      },
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        -- height = function (_, _, max_lines) return max_lines end,
        height = 0.8,
        preview_cutoff = 0,
        preview_height = 10,
        prompt_position = "top",
      },
    },
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ----- trouble.nvim
        ["<M-t>"] = open_with_trouble,
        ["<M-S-t>"] = add_to_trouble,
        ----- cder.nvim
        default = function(directory)
          vim.cmd.cd(directory)
        end,
        ["<C-t>"] = function(directory)
          vim.cmd.tcd(directory)
        end,
      },
      n = {
        ["q"] = actions.close,
        ----- trouble.nvim
        ["<M-t>"] = open_with_trouble,
        ["<M-S-t>"] = add_to_trouble,
        ----- cder.nvim
        default = function(directory)
          vim.cmd.cd(directory)
        end,
        ["<C-t>"] = function(directory)
          vim.cmd.tcd(directory)
        end,
      },
    },
  },
  pickers = {
    git_files = {
      git_command = { "git", "ls-files", "--exclude-standard", "--cached", "--others" },
    },
  },
  extensions = {
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ["_"] = false, -- This key will be the default
        json = true,
        yaml = true,
      },
    },
    frecency = {
      db_safe_mode = false, -- NOTE: for noice.nvim
    },
    cder = {
      command_executer = { "bash", "-c" },
      -- dir_command = { "fd", "--type=d", ".", os.getenv("HOME") },
      dir_command = {
        "fd",
        "-H",
        "-L",
        "-d=1",
        "-t=d",
        ".",
        os.getenv("HOME") .. "/.config",
        os.getenv("HOME") .. "/.venvs",
        os.getenv("XDG_DATA_HOME") .. "/nvim-data/lazy",
        os.getenv("DEV_PROJ"),
        "-E=dict",
        "-E=docs",
      },
      entry_maker = function(line)
        return {
          value = line,
          display = function(entry)
            return "" .. line:gsub(os.getenv("HOME") .. "/", ""), { { { 1, 3 }, "Directory" } }
          end,
          ordinal = line,
        }
      end,
      pager_command = "bat --plain --paging=always --pager='less -RS'",
      previewer_command = "exa "
        .. "-a "
        .. "--color=always "
        .. "-T "
        .. "--level=3 "
        .. "--icons "
        .. "--git-ignore "
        .. "--long "
        .. "--no-permissions "
        .. "--no-user "
        .. "--no-filesize "
        .. "--git "
        .. "--ignore-glob=.git",
    },
  },
})

-- keymaps
local keymap = vim.keymap
local opts = { silent = true }

opts.desc = "Telescope find_files"
keymap.set("n", "<Leader>ff", ":<C-u>Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git<CR>", opts)
opts.desc = "Telescope live_grep"
keymap.set("n", "<Leader>fg", ":<C-u>Telescope live_grep<CR>", opts)
opts.desc = "Telescope Git files"
keymap.set("n", "<Leader>fGf", ":<C-u>Telescope git_files<CR>", opts)
opts.desc = "Telescope current buffer"
keymap.set("n", "<Leader>fl", ":<C-u>Telescope current_buffer_fuzzy_find<CR>", opts)
opts.desc = "Telescope jumplist"
keymap.set("n", "<Leader>fj", function()
  local jumplist = vim.fn.getjumplist()
  builtin.jumplist({
    on_complete = {
      function(self)
        -- select current
        local n = #jumplist[1]
        if n ~= jumplist[2] then
          self:move_selection(jumplist[2] - #jumplist[1] + 1)
        end
      end,
    },
  })
end, opts)
opts.desc = "Telescope buffers"
keymap.set("n", "<Leader>fb", ":<C-u>Telescope buffers<CR>", opts)
opts.desc = "Telescope oldfiles"
keymap.set("n", "<Leader>fh", ":<C-u>Telescope oldfiles<CR>", opts)
opts.desc = "Telescope help-tags"
keymap.set("n", "<Leader>fH", ":<C-u>Telescope help_tags<CR>", opts)
opts.desc = "Telescope commands"
keymap.set("n", "<Leader>fc", ":<C-u>Telescope commands<CR>", opts)
opts.desc = "Telescope command history"
keymap.set("n", "<Leader>f:", ":<C-u>Telescope command_history<CR>", opts)
opts.desc = "Telescope diagnostics"
keymap.set("n", "<Leader>fd", ":<C-u>Telescope diagnostics<CR>", opts)
opts.desc = "Telescope QuickFix"
keymap.set("n", "<Leader>fq", ":<C-u>Telescope quickfix<CR>", opts)
opts.desc = "Telescope marks"
keymap.set("n", "<Leader>fm", ":<C-u>Telescope marks<CR>", opts)
opts.desc = "Telescope keymaps"
keymap.set("n", "<Leader>fk", ":<C-u>Telescope keymaps<CR>", opts)
opts.desc = "Telescope harpoon-marks"
keymap.set("n", "<Leader>ht", ":<C-u>Telescope harpoon marks<CR>", opts)
opts.desc = "Telescope ext frecency"
keymap.set("n", "<Leader>fp", function()
  ext.frecency.frecency({ workspace = "CWD" })
end, opts)
opts.desc = "Telescope ext aerial"
keymap.set("n", "<Leader>fs", function()
  ext.aerial.aerial()
end, opts)
opts.desc = "Telescope ext dap-commands"
keymap.set("n", "<Leader>dc", function()
  ext.dap.commands()
end, opts)
opts.desc = "Telescope ext dap-config"
keymap.set("n", "<Leader>dC", function()
  ext.dap.configurations()
end, opts)
opts.desc = "Telescope ext dap-breakpoints"
keymap.set("n", "<Leader>dB", function()
  ext.dap.list_breakpoints()
end, opts)
opts.desc = "Telescope ext dap-frames"
keymap.set("n", "<Leader>df", function()
  ext.dap.frames()
end, opts)
opts.desc = "Telescope bookmarks"
keymap.set("n", "<Leader>fB", ":<C-u>Telescope bookmarks<CR>", opts)
opts.desc = "Telescope noice"
keymap.set("n", "<Leader>fn", ":<C-u>Telescope noice<CR>", opts)
opts.desc = "Telescope cder"
keymap.set("n", "<Leader>f\\", ":<C-u>Telescope cder<CR>", opts)
opts.desc = "Telescope Todo"
keymap.set("n", "<Leader>tt", ":<C-u>TodoTelescope<CR>", opts)
opts.desc = "Telescope Treesitter symbols"
keymap.set("n", "<Leader>ft", ":<C-u>Telescope treesitter<CR>", opts)
opts.desc = "Telescope colorscheme"
keymap.set("n", "<Leader>fC", ":<C-u>Telescope colorscheme<CR>", opts)
opts.desc = "Telescope autocommands"
keymap.set("n", "<Leader>fa", ":<C-u>Telescope autocommands<CR>", opts)

-- NativeLSP pickers
opts.desc = "Telescope LSP dynamic workspace symbols"
keymap.set("n", "<Leader>fS", function()
  builtin.lsp_dynamic_workspace_symbols()
end, opts)
opts.desc = "Telescope LSP references"
keymap.set("n", "<Leader>fr", function()
  builtin.lsp_references()
end, opts)
opts.desc = "Telescope LSP definitions"
keymap.set("n", "<Leader>fd", function()
  builtin.lsp_definitions()
end, opts)
opts.desc = "Telescope LSP type definitions"
keymap.set("n", "<Leader>fD", function()
  builtin.lsp_type_definitions()
end, opts)
opts.desc = "Telescope LSP implementations"
keymap.set("n", "<Leader>fi", function()
  builtin.lsp_implementations()
end, opts)

-- Git pickers
opts.desc = "Telescope Git commits"
keymap.set("n", "<Leader>fGc", function()
  builtin.git_commits()
end, opts)
opts.desc = "Telescope Git branches"
keymap.set("n", "<Leader>fGb", function()
  builtin.git_branches()
end, opts)
opts.desc = "Telescope Git status"
keymap.set("n", "<Leader>fGs", function()
  builtin.git_status()
end, opts)
opts.desc = "Telescope Git stash"
keymap.set("n", "<Leader>fGS", function()
  builtin.git_stash()
end, opts)

-- load extensions
telescope.load_extension("frecency")
telescope.load_extension("aerial")
telescope.load_extension("dap")
telescope.load_extension("bookmarks")
telescope.load_extension("noice")
telescope.load_extension("cder")
