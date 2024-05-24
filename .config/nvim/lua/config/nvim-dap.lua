local dap, dapui = require("dap"), require("dapui")

-- setup DAP UI
dapui.setup()

-- use nvim-dap events to trigger DAP UI automatically
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- keymaps for UI
vim.keymap.set("n", "<Leader>dt", function() dapui.toggle({ reset = true }) end,
  { noremap = true, desc = "DAP UI Toggle" })

---@param elem_name string
---@param args? dapui.FloatElementArgs
vim.keymap.set("n", "<Leader>da", function() dapui.float_element(elem_name, args) end,
  { noremap = true, desc = "DAP UI Float" })

-- keymaps for DAP
vim.keymap.set("n", "<Leader>db", ":<C-u>DapToggleBreakpoint<CR>", { noremap = true, desc = "DapToggleBreakpoint" })
vim.keymap.set("n", "<F9>", ":<C-u>DapContinue<CR>", { noremap = true, desc = "DapContinue" })
vim.keymap.set("n", "<F10>", ":<C-u>DapStepOver<CR>", { noremap = true, desc = "DapStepOver" })
vim.keymap.set("n", "<C-F10>", ":<C-u>DapStepInto<CR>", { noremap = true, desc = "DapStepInto" })
vim.keymap.set("n", "<M-F10>", ":<C-u>DapStepOut<CR>", { noremap = true, desc = "DapStepOut" })
