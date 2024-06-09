local M = {}

function M.is_linux()
  return vim.fn.has("linux") == 1
end

function M.is_mac()
  return vim.fn.has("mac") == 1
end

function M.is_windows()
  return vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1
end

function M.is_wsl()
  return vim.fn.has("wsl") == 1
end

return M
