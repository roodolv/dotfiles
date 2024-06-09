local neotest = require("neotest")
local lib = require("neotest.lib")
local util = require("util")

-- get neotest namespace (api call creates or returns namespace)
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

neotest.setup({
  adapters = {
    -- NOTE: If you use this adapter, do not add other adapter(e.g neotest-rust)
    require("rustaceanvim.neotest"),
    require("neotest-jest")({
      jestCommand = "npm test --",
      jestConfigFile = "custom.jest.config.ts",
      -- If you want neotest-jest to be able to discover parameterized tests
      jest_test_discovery = false,
      discovery = {
        enabled = false,
      },
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = { justMyCode = false },
      runner = "pytest",
      args = { "--log-level", "DEBUG" },
      python = function()
        if util.is_windows then
          return "~/.venvs/pytest/Scripts/python"
        else
          return ""
        end
      end,
      -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
      -- instances for files containing a parametrize mark (default: false)
      pytest_discover_instances = false,
    }),
    -- require("neotest-go")({
    --   experimental = {
    --     test_table = true,
    --   },
    --   args = { "-count=1", "-timeout=60s" },
    --   -- If you want for 'go test' to run recursively, you need make this true
    --   recursive_run = true,
    -- }),
    -- require("neotest-gtest").setup({
    --   -- fun(string) -> string: takes a file path as string and returns its project root
    --   -- directory
    --   -- neotest.lib.files.match_root_pattern() is a convenient factory for these functions:
    --   -- it returns a function that returns true if the directory contains any entries
    --   -- with matching names
    --   root = lib.files.match_root_pattern({
    --     "compile_commands.json",
    --     "compile_flags.txt",
    --     "WORKSPACE",
    --     ".clangd",
    --     "init.lua",
    --     "init.vim",
    --     "build",
    --     ".git"
    --   }),
    --   -- which debug adapter to use? dap.adapters.<this debug_adapter> must be defined.
    --   debug_adapter = "codelldb",
    --   -- fun(string) -> bool: takes a file path as string and returns true if it contains
    --   -- tests
    --   is_test_file = function(file)
    --     -- by default, returns true if the file stem starts with test_ or ends with _test
    --     -- the extension must be cpp/cppm/cc/cxx/c++
    --   end,
    --   -- How many old test results to keep on disk (stored in stdpath('data')/neotest-gtest/runs)
    --   history_size = 3,
    --   -- To prevent large projects from freezing your computer, there's some throttling
    --   -- for -- parsing test files. Decrease if your parsing is slow and you have a
    --   -- monster PC.
    --   parsing_throttle_ms = 10,
    --   -- set configure to a normal mode key which will run :ConfigureGtest (suggested:
    --   -- "C", nil by default)
    --   mappings = { configure = nil },
    --   summary_view = {
    --     -- How long should the header be in tests short summary?
    --     -- ________TestNamespace.TestName___________ <- this is the header
    --     header_length = 80,
    --     -- Your shell's colors, if the default ones don't work.
    --     shell_palette = {
    --       passed = "\27[32m",
    --       skipped = "\27[33m",
    --       failed = "\27[31m",
    --       stop = "\27[0m",
    --       bold = "\27[1m",
    --     },
    --   },
    --   -- What extra args should ALWAYS be sent to google test?
    --   -- if you want to send them for one given invocation only,
    --   -- send them to `neotest.run({extra_args = ...})`
    --   -- see :h neotest.RunArgs for details
    --   extra_args = {},
    --   -- see :h neotest.Config.discovery. Best to keep this as-is and set
    --   -- per-project settings in neotest instead.
    --   filter_dir = function(name, rel_path, root)
    --     -- see :h neotest.Config.discovery for defaults
    --   end,
    -- }),
    -- require("neotest-bash"),
  },
})

local opts = { silent = true }

opts.desc = "neotest Run current file"
vim.keymap.set("n", "<F8>", function() neotest.run.run(vim.fn.expand("%")) end, opts)

-- Jest: to run tests with watch mode
-- opts.desc = "neotest Run jest --watch"
-- vim.keymap.set("n", "<Leader>tjw", function() neotest.run.run({ jestCommand = "jest --watch " }) end, opts)

-- Go: go test command can be sent using the extra_args field
-- opts.desc = "neotest Run go-test with CLI options"
-- vim.keymap.set("n", "<Leader>tgC", function() neotest.run.run({path, extra_args = {"-race"}}) end, opts)
