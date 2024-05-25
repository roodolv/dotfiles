local dap, dapui = require("dap"), require("dapui")
local dap_py = require("dap-python")

-- setup DAP UI
dapui.setup()

-- setup nvim-dap-python
dap_py.setup("~/.venvs/debugpy/Scripts/python")

-- NOTE: configure a different runner (e.g. pytest)
-- dap_py.test_runner = "pytest"

-- use nvim-dap events to trigger DAP UI automatically
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- options for keymaps
local opts = { noremap = true, silent = true }

-- keymaps for UI
opts.desc = "DAP UI Toggle"
vim.keymap.set("n", "<Leader>dt", function() dapui.toggle({ reset = true }) end, opts)

---@param elem_name string
---@param args? dapui.FloatElementArgs
opts.desc = "DAP UI Float Element"
vim.keymap.set("n", "<Leader>de", function() dapui.float_element(elem_name, args) end, opts)

-- keymaps for DAP
opts.desc = "DapToggleBreakpoint"
vim.keymap.set("n", "<Leader>db", ":<C-u>DapToggleBreakpoint<CR>", opts)
opts.desc = "DapContinue"
vim.keymap.set("n", "<F9>", ":<C-u>DapContinue<CR>", opts)
opts.desc = "DapStepOver"
vim.keymap.set("n", "<F10>", ":<C-u>DapStepOver<CR>", opts)
opts.desc = "DapStepInto"
vim.keymap.set("n", "<C-F10>", ":<C-u>DapStepInto<CR>", opts)
opts.desc = "DapStepOut"
vim.keymap.set("n", "<M-F10>", ":<C-u>DapStepOut<CR>", opts)

-- keymaps for extension
opts.desc = "DAP Python test_method"
vim.keymap.set("n", "<Leader>dpm", function() dap_py.test_method() end, opts)
opts.desc = "DAP Python test_class"
vim.keymap.set("n", "<Leader>dpc", function() dap_py.test_class() end, opts)
opts.desc = "DAP Python debug_selection"
vim.keymap.set("x", "<Leader>dps", function()
  vim.api.nvim_input("<Esc>")
  dap_py.debug_selection()
end, opts)
