return {
  -----------------------------------------------------------------
  -- theme
  -----------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end
  },
  -----------------------------------------------------------------
  -- startup
  -----------------------------------------------------------------
  {
    "mhinz/vim-startify",
    lazy = false,
    config = function()
      require("config/startify")
    end
  },
  -----------------------------------------------------------------
  -- pane/tab/window
  -----------------------------------------------------------------
  {
    "simeji/winresizer",
    keys = {
      { "<Leader>R", ":<C-u>WinResizerStartResize<CR>", mode = "n", silent = true, desc = "WinResizerStartResize" },
    },
    init = function()
      require("config/winresizer")
    end,
  },
  {
    "preservim/tagbar",
    keys = {
      { "<Leader>gt", ":<C-u>TagbarToggle<CR>", mode = "n", silent = true, desc = "TagbarToggle" },
    },
    config = function()
      require("config/tagbar")
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<Leader>gu", ":<C-u>UndotreeToggle<CR>", mode = "n", silent = true, desc = "UndotreeToggle" },
    },
    config = function()
      require("config/undotree")
    end,
  },
  -----------------------------------------------------------------
  -- search/navigation
  -----------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "ThePrimeagen/refactoring.nvim",
      -- "danielfalk/smart-open.nvim",
    },
    cmd = "Telescope",
    keys = {
      { "<Leader>ff", function() require("telescope.builtin").find_files() end, desc = "List project files", mode = "n", silent = true },
      { "<Leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep", mode = "n", silent = true },
      { "<Leader>fl", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Current buffer fuzzy find", mode = "n", silent = true },
      { "<Leader>fb", function() require("telescope.builtin").buffers() end, desc = "List buffers", mode = "n", silent = true },
      { "<Leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "List recent files", mode = "n", silent = true },
      { "<Leader>fh", function() require("telescope.builtin").help_tags() end, desc = "List help-tags", mode = "n", silent = true },
      { "<Leader>fc", function() require("telescope.builtin").commands() end, desc = "List commands", mode = "n", silent = true },
      { "<Leader>f:", function() require("telescope.builtin").command_history() end, desc = "List command history", mode = "n", silent = true },
      { "<Leader>fm", function() require("telescope.builtin").keymaps() end, desc = "List keymaps", mode = "n", silent = true },
      { "<Leader>fp", function() require("telescope").extensions.frecency.frecency { workspace = "CWD", } end, desc = "List prioritized by frecency algorithm", mode = "n", silent = true },
      { "<Leader>rr", function() require("telescope").extensions.refactoring.refactors() end, desc = "List refactoring methods" , mode = {"n", "x"}, silent = true }
      -- { "<Leader>fs", function() require("telescope").extensions.smart_open.smart_open() end, desc = "List prioritized by frecency algorithm", mode = "n", silent = true },
    },
    config = function ()
      require("config/telescope")
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- {
  --   "danielfalk/smart-open.nvim",
  --   lazy = true,
  --   branch = "0.2.x",
  --   dependencies = {
  --     "kkharji/sqlite.lua",
  --   },
  -- },
  {
    "ThePrimeagen/harpoon",
    event = { "BufReadPre", "BufNewFile" },
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function ()
      require("config/harpoon")
    end
  },
  {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    ---@type Flash.Config
    opts = {},
    config = function ()
      require("config/flash")
    end
  },
  -----------------------------------------------------------------
  -- filer/browser
  -----------------------------------------------------------------
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      -- {
      --   "refractalize/oil-git-status.nvim",
      --   config = function()
      --     require("oil").setup({
      --       win_options = { signcolumn = "yes:2", }
      --     })
      --     require("config/oil-git-status")
      --   end,
      -- },
    },
    init = function()
      vim.keymap.set("n", "-", ":<C-u>Oil .<CR>", { silent = true })
    end,
    config = function()
      require("config/oil")
    end,
  },
  -----------------------------------------------------------------
  -- visual(syntax/indent/etc)
  -----------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      { "andymass/vim-matchup",
        keys = { "%" },
      },
    },
    build = ":TSUpdate",
    install = function()
      require("nvim-treesitter.install").setup({
        compilers = { "clang" }
      })
    end,
    config = function()
      require("config/nvim-treesitter")
    end,
  },
  {
    "Yggdroot/indentLine",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config/indentline")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      require("config/todo-comments")
      vim.api.nvim_set_keymap('n', '<Leader>tt', ':<C-u>TodoTelescope<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<Leader>tf', ':<C-u>TodoQuickFix<CR>', { noremap = true })
    end,
  },
  -----------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("config/mason-lspconfig")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function ()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          local opts = { buffer = ev.buf }
          -- TODO: fix here
          vim.keymap.set('n', 'gf', function()
            vim.lsp.buf.format { async = true }
          end, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, opts)
          vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, opts)
        end,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  -----------------------------------------------------------------
  -- snippets/completion
  -----------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- For LuaSnip
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- For Neovim Lua API
      "folke/neodev.nvim",
    },
    config = function()
      require("config/nvim-cmp")
    end
  },
  { "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function ()
      require("luasnip.loaders.from_vscode").lazy_load()
      -- LuaSnip official settings
      local ls = require("luasnip")
      -- TODO: fix & understand these
      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, {silent = true})
    end
  },
  -- {
  --   "Exafunction/codeium.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("codeium").setup({})
  --   end
  -- },
  -----------------------------------------------------------------
  -- Git
  -----------------------------------------------------------------
  {
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
    keys = {
      { "<Leader>gm", ":<C-u>GitMessenger<CR>", mode = "n", silent = true, desc = "GitMessenger" },
    },
    config = function()
      require("config/git-messenger")
    end,
  },
  {
    "airblade/vim-gitgutter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.keymap.set("n", "]h", "<Plug>(GitGutterNextHunk)")
      vim.keymap.set("n", "[h", "<Plug>(GitGutterPrevHunk)")
    end,
  },
  -----------------------------------------------------------------
  -- editing
  -----------------------------------------------------------------
  {
    "tpope/vim-repeat",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "tpope/vim-surround",
      "tpope/vim-commentary",
      { "glts/vim-radical",
        dependencies = { "glts/vim-magnum" },
      },
    },
  },
  {
    "tommcdo/vim-exchange",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "kana/vim-operator-replace",
    dependencies = {
      "kana/vim-operator-user",
    },
    keys = {
      { "'", "<Plug>(operator-replace)", silent = true },
    },
  },
  { "haya14busa/vim-asterisk",
    keys = {
      { "*", "<Plug>(asterisk-z*)<Plug>(is-nohl-1)" },
      { "#", "<Plug>(asterisk-z#)<Plug>(is-nohl-1)" },
      { "g*", "<Plug>(asterisk-gz*)<Plug>(is-nohl-1)" },
      { "g#", "<Plug>(asterisk-gz#)<Plug>(is-nohl-1)" },
    },
  },
  {
    "jiangmiao/auto-pairs",
    -- event = { "BufReadPre", "BufNewFile", "BufEnter" },
  },
  {
    "bronson/vim-trailing-whitespace",
    keys = {
      { "<Leader>T", ":<C-u>FixWhitespace<CR>", mode= "n", silent = true, desc = "FixWhitespace" },
    },
  },
}
