local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local ext = telescope.extensions

local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add

telescope.setup({
  defaults = {
    vimgrep_arguments = { "rg", "-L", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
    prompt_prefix = "   ",
    selection_caret = " ",
    file_ignore_patterns = { ".git/", "node_modules" },
    path_display = {
      filename_first = {
        reverse_directories = false
      }
    },
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        -- height = function (_, _, max_lines) return max_lines end,
        height = 0.8,
        preview_cutoff = 0,
        preview_height = 10,
        prompt_position = "top",
      }
    },
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
        ["<M-t>"] = open_with_trouble,
        ["<M-S-t>"] = add_to_trouble,
      },
      n = {
        ["q"] = actions.close,
        ["<M-t>"] = open_with_trouble,
        ["<M-S-t>"] = add_to_trouble,
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
  },
})

-- keymaps
local keymap = vim.keymap
local opts = { silent = true }

opts.desc = "Telescope find_files"
keymap.set("n", "<Leader>ff", ":<C-u>Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git<CR>", opts)
opts.desc = "Telescope live_grep"
keymap.set("n", "<Leader>fg", ":<C-u>Telescope live_grep<CR>", opts)
opts.desc = "Telescope git_files"
keymap.set("n", "<Leader>fG", ":<C-u>Telescope git_files<CR>", opts)
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
end, opts
)
opts.desc = "Telescope buffers"
keymap.set("n", "<Leader>fb", ":<C-u>Telescope buffers<CR>", opts)
opts.desc = "Telescope oldfiles"
keymap.set("n", "<Leader>fr", ":<C-u>Telescope oldfiles<CR>", opts)
opts.desc = "Telescope help-tags"
keymap.set("n", "<Leader>fh", ":<C-u>Telescope help_tags<CR>", opts)
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
keymap.set("n", "<Leader>fp", function() ext.frecency.frecency { workspace = "CWD", } end, opts)
opts.desc = "Telescope ext aerial"
keymap.set("n", "<Leader>fs", function() ext.aerial.aerial() end, opts)
opts.desc = "Telescope ext dap-commands"
keymap.set("n", "<Leader>dc", function() ext.dap.commands() end, opts)
opts.desc = "Telescope ext dap-config"
keymap.set("n", "<Leader>dC", function() ext.dap.configurations() end, opts)
opts.desc = "Telescope ext dap-breakpoints"
keymap.set("n", "<Leader>dB", function() ext.dap.list_breakpoints() end, opts)
opts.desc = "Telescope ext dap-frames"
keymap.set("n", "<Leader>df", function() ext.dap.frames() end, opts)
opts.desc = "Telescope bookmarks"
keymap.set("n", "<Leader>fB", ":<C-u>Telescope bookmarks<CR>", opts)

-- load extensions
telescope.load_extension("frecency")
telescope.load_extension("aerial")
telescope.load_extension("dap")
telescope.load_extension("bookmarks")
