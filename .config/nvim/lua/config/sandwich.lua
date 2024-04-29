-- Copy default recipes
vim.g['sandwich#recipes'] = vim.deepcopy(vim.g['sandwich#default_recipes'])

-- Auto indentation for Visual Line
vim.list_extend(vim.deepcopy(vim.g['sandwich#recipes']), {
  {
    buns        = {'(', ')'},
    motionwise  = {'line'},
    kind        = {'add'},
    linewise    = 1,
    command     = {"'[+1,']-1normal! >>"},
  },
  {
    buns        = {'(', ')'},
    motionwise  = {'line'},
    kind        = {'delete'},
    linewise    = 1,
    command     = {"'[,']normal! <<"},
  },
  {
    buns        = {'[', ']'},
    motionwise  = {'line'},
    kind        = {'add'},
    linewise    = 1,
    command     = {"'[+1,']-1normal! >>"},
  },
  {
    buns        = {'[', ']'},
    motionwise  = {'line'},
    kind        = {'delete'},
    linewise    = 1,
    command     = {"'[,']normal! <<"},
  },
  {
    buns        = {'{', '}'},
    motionwise  = {'line'},
    kind        = {'add'},
    linewise    = 1,
    command     = {"'[+1,']-1normal! >>"},
  },
  {
    buns        = {'{', '}'},
    motionwise  = {'line'},
    kind        = {'delete'},
    linewise    = 1,
    command     = {"'[,']normal! <<"},
  }
})
