require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'css',
    'c_sharp',
    'dockerfile',
    'doxygen',
    'erlang',
    'gitignore',
    'git_config',
    'go',
    'graphql',
    'html',
    'javascript',
    'json',
    'json5',
    'jsonc',
    'kotlin',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'org',
    'perl',
    'php',
    'python',
    'regex',
    'rust',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
  },
  auto_install = true,
  highlight = { enabled = true },
  indent = { enable = true },
  endwise = { enable = true },
  matchup = { enable = true, },
  autotag = { enable = true },
  textobjects = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
})
