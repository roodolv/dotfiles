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
      { "<Leader>R", ":<C-u>WinResizerStartResize<CR>", mode = "n", silent = true },
    },
    config = function()
      require("config/winresizer")
    end,
  },
  {
    "preservim/tagbar",
    keys = {
      { "<Leader>gt", ":<C-u>TagbarToggle<CR>", mode = "n", silent = true },
    },
    config = function()
      require("config/tagbar")
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<Leader>gu", ":<C-u>UndotreeToggle<CR>", mode = "n", silent = true },
    },
    config = function()
      require("config/undotree")
    end,
  },
  -----------------------------------------------------------------
  -- search/navigation
  -----------------------------------------------------------------
  -- {
  --   "ibhagwan/fzf-lua",
  --   event = "VimEnter",
  --   dependencies = {
  --     "junegunn/fzf",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {},
  --   config = function()
  --     require("config/fzf-lua")
  --   end
  -- },
  -- TODO: Add telescope.nvim, flash.nvim here
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
      -- {
      --   "SirZenith/oil-vcs-status",
      --   config = function()
      --     require("oil").setup({
      --       win_options = { signcolumn = "number", }
      --     })
      --     require("config/oil-vcs-status")
      --   end,
      -- },
    },
    init = function()
      vim.keymap.set("n", "-", ":<C-u>Oil --float .<CR>", { silent = true })
    end,
    config = function()
      require("config/oil")
    end,
  },
  -----------------------------------------------------------------
  -- syntax/indentation
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
    event = "BufEnter",
    config = function()
      require("config/indentline")
    end,
  },
  -----------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------
  -- {
  --   "VonHeikemen/lsp-zero.nvim",
  --   branch = "v2.x",
  --   lazy = true,
  --   config = function()
  --     -- This is where you modify the settings for lsp-zero
  --     -- Note: autocompletion settings will not take effect
  --     require("lsp-zero.settings").preset({
  --       name = "minimal",
  --       set_lsp_keymaps = false,
  --       manage_nvim_cmp = true,
  --       suggest_lsp_servers = true,
  --     })
  --   end
  -- },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufEnter",
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = function() require("mason").setup() end,
      },
    },
    config = function()
      require("mason-lspconfig").setup()
      -- require("mason-lspconfig").setup_handlers {
      --     function (server_name) -- default handler (optional)
      --         require("lspconfig")[server_name].setup {}
      --     end,
      --     ["rust_analyzer"] = function ()
      --         require("rust-tools").setup {}
      --     end
      -- }
    end,
  },

  -----------------------------------------------------------------
  -- completion
  -----------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      -- For ultisnips user
      "SirVer/ultisnips",
      "quangnguyen30192/cmp-nvim-ultisnips",
    },
    config = function()
      require("config/nvim-cmp")
    end
  },
  -- {
  --   "folke/neodev.nvim",
  --   ft = "lua",
  --   config = true,
  -- },
  -----------------------------------------------------------------
  -- AGI
  -----------------------------------------------------------------
  -- repo = "Exafunction/codeium.vim"
  -- on_event = "BufEnter"
  -- # hook_add = "source ~/.config/nvim/plugins/codeium-vim.rc.vim"
  -----------------------------------------------------------------
  -- Git
  -----------------------------------------------------------------
  {
    "rhysd/git-messenger.vim",
    cmd = "GitMessenger",
    keys = {
      { "<Leader>gm", ":<C-u>GitMessenger<CR>", mode = "n", silent = true },
    },
    config = function()
      require("config/git-messenger")
    end,
  },
  {
    "airblade/vim-gitgutter",
    event = "BufEnter",
    config = function()
      vim.keymap.set("n", "]h", "<Plug>(GitGutterNextHunk)")
      vim.keymap.set("n", "[h", "<Plug>(GitGutterPrevHunk)")
    end,
  },
  -----------------------------------------------------------------
  -- editing
  -----------------------------------------------------------------
  {
    "easymotion/vim-easymotion",
    event = "BufEnter",
    config = function()
      require("config/easymotion")
    end
  },
  {
    "machakann/vim-sandwich",
    event = "BufEnter",
    config = function()
      require("config/sandwich")
    end,
  },
  {
    "tpope/vim-repeat",
    event = "BufEnter",
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
    event = "BufEnter",
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
    event = "BufEnter",
  },
  {
    "bronson/vim-trailing-whitespace",
    keys = {
      { "<Leader>T", ":<C-u>FixWhitespace<CR>", mode= "n", silent = true },
    },
  },
}
