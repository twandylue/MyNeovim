local M = {}

local statusUtil, utils = pcall(require, "lspconfig.util")
if not statusUtil then
  print("Util is not found")
  return
end

local status_lspconfig, nvim_lsp = pcall(require, "lspconfig")
if not status_lspconfig then
  print("lspconfig is not installed")
  return
end

M.utils = utils
M.nvim_lsp = nvim_lsp

return M
