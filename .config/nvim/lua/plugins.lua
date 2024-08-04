return {
  -----------------------------------------------------------------
  -- theme
  -----------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("tokyonight")
    end
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
      -- vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.material_style = "deep ocean"
      vim.cmd.colorscheme("material")
    end,
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
  -- {
  --   "dstein64/vim-startuptime",
  --   lazy = false,
  -- },
  -----------------------------------------------------------------
  -- pane/tab/window
  -----------------------------------------------------------------
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    priority = 1001,
    config = function()
      require("config/smart-splits")
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    event = { "BufReadPost", "BufNewFile" },
    version = "*",
    config = function()
      require("config/no-neck-pain")
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
      "nvim-telescope/telescope-dap.nvim",
      "zane-/cder.nvim",
    },
    keys = {
      "<Leader>ff", "<Leader>fg", "<Leader>fG", "<Leader>fl", "<Leader>fj",
      "<Leader>fb", "<Leader>fr", "<Leader>fh", "<Leader>fc", "<Leader>f:",
      "<Leader>fd", "<Leader>fq", "<Leader>fm", "<Leader>fk", "<Leader>ht",
      "<Leader>fp", "<Leader>rr", "<Leader>fs", "<Leader>dc", "<Leader>dC",
      "<Leader>dB", "<Leader>df", "<Leader>fB", "<Leader>fn", "<Leader>f\\",
      "<Leader>ft", "<Leader>fC", "<Leader>fa",
      "<Leader>fS", "<Leader>fR", "<Leader>fd", "<Leader>fD", "<Leader>fi",
      "<Leader>fGc", "<Leader>fGC", "<Leader>fGb", "<Leader>fGs", "<Leader>fGS",
    },
    config = function()
      require("config/telescope")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      "<Leader>H", "<Leader>hx", "<C-Up>", "<C-Down>",
      "<Leader>h1", "<Leader>h2", "<Leader>h3", "<Leader>h4",
    },
    config = function()
      require("config/harpoon")
    end
  },
  {
    "folke/flash.nvim",
    keys = { "f", "F", "t", "T", "s", "S", "<Leader>s", "<C-s>", "R" },
    config = function()
      require("config/flash")
    end
  },
  {
    "chentoast/marks.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("marks").setup({
        mappings = {
          next = "]m",
          prev = "[m",
        },
      })
    end,
  },
  {
    "crusj/bookmarks.nvim",
    lazy = true,
    branch = "main",
    dependencies = { "nvim-web-devicons" },
    keys = { "<Tab><Tab>", "<Leader>bg", "<Leader>bl", "<Leader>bd", "<Leader>bs" },
    config = function()
      require("config/bookmarks")
    end,
  },
  {
    "otavioschwanck/arrow.nvim",
    lazy = true,
    keys = { "'", "\\", "<S-Down>", "<S-Up>" },
    config = function()
      require("config/arrow")
    end
  },
  -----------------------------------------------------------------
  -- filer/browser
  -----------------------------------------------------------------
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    keys = "-",
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
    config = function()
      require("config/oil")
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<Leader>U", ":<C-u>UndotreeToggle<CR>", mode = "n", silent = true, desc = "UndotreeToggle" },
    },
    config = function()
      require("config/undotree")
    end,
  },
  -----------------------------------------------------------------
  -- visual(statusline/bufferline/cmdline/etc)
  -----------------------------------------------------------------
  {
    "tamton-aquib/staline.nvim",
    lazy = false,
    config = function()
      require("config/staline")
    end,
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   config = function()
  --     require("config/lualine")
  --   end,
  -- },
  {
    "akinsho/bufferline.nvim",
    lazy = false,
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("config/bufferline")
    end,
  },
  {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("config/noice")
    end,
  },
  {
    "folke/which-key.nvim",
    lazy = true,
    keys = { "WhichKey", "<Leader>K" },
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    config = function()
      require("config/which-key")
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
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
      {
        "andymass/vim-matchup",
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
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {},
    config = function()
      require("config/indent-blankline")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config/todo-comments")
    end,
  },
  {
    "mvllow/modes.nvim",
    tag = "v0.2.1",
    event = { "InsertEnter",  "CursorMoved" },
    config = function()
      require("config/modes")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("config/illuminate")
    end,
  },
  {
    "tamton-aquib/duck.nvim",
    keys = {  "<Leader>dk",  "<Leader>dd", "<Leader>da" },
    config = function()
      require("config/duck")
    end,
  },
  -----------------------------------------------------------------
  -- LSP
  -----------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "SmiteshP/nvim-navbuddy" },
      { "folke/neodev.nvim" }, -- For Neovim Lua API
    },
    config = function()
      require("config/lspconfig")
    end,
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   lazy = true,
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "neovim/nvim-lspconfig",
  --   },
  --   config = function()
  --     require("config/mason-lspconfig")
  --   end,
  -- },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("config/lspsaga")
    end,
  },
  {
    "aznhe21/actions-preview.nvim",
    lazy = true,
    event = "LspAttach",
    config = function()
      require("config/actions-preview")
    end,
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    branch = "dev", -- Trouble v3
    dependencies = "nvim-tree/nvim-web-devicons",
    cmd = { "Trouble" },
    keys = {
      "<Leader>xr", "<Leader>xx", "<Leader>xX", "<Leader>xs", "<Leader>xl",
      "<Leader>xQ", "<Leader>xL",
    },
    config = function()
      require("config/trouble")
    end,
  },
  {
    "SmiteshP/nvim-navbuddy",
    lazy = true,
    keys = { "<Leader>N" },
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("config/navbuddy")
    end,
  },
  {
    "stevearc/aerial.nvim",
    lazy = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    keys = "<Leader>A",
    opts = {},
    config = function()
      require("config/aerial")
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
    opts = {}
  },
  -----------------------------------------------------------------
  -- completion/snippets/format/lint
  -----------------------------------------------------------------
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "petertriho/cmp-git" },
      { "windwp/nvim-autopairs" },
      { "onsails/lspkind.nvim" },
      ----- For LuaSnip
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
    },
    config = function()
      require("config/nvim-cmp")
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("config/lsp_signature")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      require("luasnip").setup({
        load_ft_func = require("luasnip_snippets.common.snip_utils").load_ft_func,
        ft_func = require("luasnip_snippets.common.snip_utils").ft_func,
        enable_autosnippets = true,
      })
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/luasnip" })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "mireq/luasnip-snippets",
    event = { "InsertEnter", },
    dependencies = { "L3MON4D3/LuaSnip" },
    config = function()
      require("luasnip_snippets.common.snip_utils").setup()
    end
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre", },
    opts = {},
    config = function()
      require("config/conform")
    end,
  },
  {
    "Exafunction/codeium.vim",
    lazy = true,
    event = { "InsertEnter", },
    config = function ()
      require("config/codeium-vim")
    end,
  },
  {
    "Exafunction/codeium.nvim",
    lazy = true,
    event = { "InsertEnter", },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("config/codeium-nvim")
    end
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   lazy = true,
  --   event = { "BufReadPre", "BufNewFile" },
  --   config = function()
  --     require("config/nvim-lint")
  --   end,
  -- },
  -----------------------------------------------------------------
  -- language-specific
  -----------------------------------------------------------------
  ----- Rust
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,
    config = function()
      require("config/rustaceanvim")
    end,
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("config/crates")
    end,
  },
  -----------------------------------------------------------------
  -- Git
  -----------------------------------------------------------------
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("config/gitsigns")
    end,
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    keys = "<Leader>D",
    config = function()
      require("config/diffview")
    end,
  },
  {
    "tpope/vim-fugitive",
    event = { "BufReadPre", "BufNewFile" },
  },
  -----------------------------------------------------------------
  -- test/debug
  -----------------------------------------------------------------
  {
    "nvim-neotest/neotest",
    lazy = true,
    keys = { "<F8>", },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- adapters
      "nvim-neotest/neotest-jest",
      "nvim-neotest/neotest-python",
      -- "nvim-neotest/neotest-go",
      -- "alfaix/neotest-gtest",
      -- "rcasia/neotest-bash",
      -- "adrigzr/neotest-mocha",
      -- "jfpedroza/neotest-elixir",
      -- "olimorris/neotest-phpunit",
    },
    config = function()
      require("config/neotest")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      "<Leader>dt", "<Leader>de", "<Leader>db",
      "<F9>", "<F10>", "<C-F10>", "<M-F10>",
      "<Leader>dpm", "<Leader>dpc", "<Leader>dps", -- dap-python
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("config/nvim-dap")
    end,
  },
  -----------------------------------------------------------------
  -- terminal/external
  -----------------------------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    keys = { "<C-\\>", "<Leader>tt", "<Leader>tl", "<Leader>tg", "<Leader>tf", "<Leader>tb", "<Leader>ts" },
    version = "*",
    config = function()
      require("config/toggleterm")
    end,
  },
  -----------------------------------------------------------------
  -- documentation
  -----------------------------------------------------------------
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = {
      "BufReadPre */Obsidian/main/**.md",
      "BufNewFile */Obsidian/main/**.md",
      "BufReadPre */Hugo/myblog/**.md",
      "BufNewFile */Hugo/myblog/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("config/obsidian")
    end,
  },
  {
    "antonk52/markdowny.nvim",
    ft = "markdown",
    config = function()
      require("markdowny").setup({ "markdown", "markdown.mdx", "txt" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      require("config/markdown-preview")
    end,
  },
  -----------------------------------------------------------------
  -- editing
  -----------------------------------------------------------------
  {
    "tpope/vim-repeat",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "tpope/vim-commentary",
      {
        "glts/vim-radical",
        dependencies = { "glts/vim-magnum" },
      },
    },
  },
  {
    "tpope/vim-abolish",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-eunuch",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end
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
      { "<Leader>r", "<Plug>(operator-replace)", silent = true },
    },
  },
  {
    "haya14busa/vim-asterisk",
    keys = {
      { "*",  "<Plug>(asterisk-z*)<Plug>(is-nohl-1)" },
      { "#",  "<Plug>(asterisk-z#)<Plug>(is-nohl-1)" },
      { "g*", "<Plug>(asterisk-gz*)<Plug>(is-nohl-1)" },
      { "g#", "<Plug>(asterisk-gz#)<Plug>(is-nohl-1)" },
    },
  },
  {
    "bronson/vim-trailing-whitespace",
    keys = {
      { "zt", ":<C-u>FixWhitespace<CR>", mode = "n", silent = true, desc = "FixWhitespace" },
    },
  },
  -----------------------------------------------------------------
  -- dev
  -----------------------------------------------------------------
  {
    "roodolv/markdown-toggle.nvim",
    dev = true,
    ft = "markdown",
    config = function()
      require("markdown-toggle").setup({
        use_default_keymaps = true,
        mimic_obsidian_list = false,
        box_table = { "x" },
      })
    end,
  },
}
