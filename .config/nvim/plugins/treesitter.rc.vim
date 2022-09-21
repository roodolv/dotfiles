" Lua Settings
lua <<EOF
require 'nvim-treesitter.install'.compilers = { "gcc", "clang" }
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {
      'nix'
    },
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
EOF
