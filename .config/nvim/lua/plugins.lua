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
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "ThePrimeagen/refactoring.nvim",
      -- "danielfalk/smart-open.nvim",
    },
    keys = {
      "<Leader>ff", "<Leader>fg", "<Leader>fG", "<Leader>fl", "<Leader>fj",
      "<Leader>fb", "<Leader>fr", "<Leader>fh", "<Leader>fc", "<Leader>f:",
      "<Leader>fq", "<Leader>fm", "<Leader>fk", "<Leader>fp", "<Leader>rr"
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
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      "<Leader>ht", "<Leader>hx",
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
      {
        "refractalize/oil-git-status.nvim",
        config = function()
          require("oil").setup({
            win_options = { signcolumn = "yes:2", }
          })
          require("config/oil-git-status")
        end,
      },
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
    lazy = true,
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
      require("config/lspconfig")
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  -----------------------------------------------------------------
  -- format/snippets/completion
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
      local ls = require("luasnip")
      -- TODO: fix here
      vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true})
    end
  },
  {
    "nvimtools/none-ls.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config/none-ls")
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
