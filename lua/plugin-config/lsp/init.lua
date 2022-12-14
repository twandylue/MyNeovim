local bashls = require("plugin-config.lsp.configs.bashls")
local csharp_ls = require("plugin-config.lsp.configs.csharp_ls")
local clangd = require("plugin-config.lsp.configs.clangd")
local cmake = require("plugin-config.lsp.configs.cmake")
local dockerls = require("plugin-config.lsp.configs.dockerls")
local jsonls = require("plugin-config.lsp.configs.jsonls")
local marksman = require("plugin-config.lsp.configs.marksman")
local pyright = require("plugin-config.lsp.configs.pyright")
local rust = require("plugin-config.lsp.configs.rust")
local sqls = require("plugin-config.lsp.configs.sqls")
local sumneko_lua = require("plugin-config.lsp.configs.sumneko_lua")
local tsserver = require("plugin-config.lsp.configs.tsserver")
local yamlls = require("plugin-config.lsp.configs.yamlls")
local ih = require("inlay-hints")

local status_neodev, lua_dev = pcall(require, "neodev")
if not status_neodev then
  print("neodev is not installed")
  return
end

local M = {
  on_attach_rust_tool = nil,
}

local on_attach_rust_tool = function(client, _)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
    vim.api.nvim_command([[augroup END]])
  end
end

local on_attach = function(client, bufnr)
  ih.on_attach(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command([[augroup Format]])
    vim.api.nvim_command([[autocmd! * <buffer>]])
    vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
    vim.api.nvim_command([[augroup END]])
  end
end

rust(on_attach_rust_tool)
yamlls(on_attach)
jsonls(on_attach)
tsserver(on_attach)
bashls(on_attach)
csharp_ls(on_attach)
pyright(on_attach)
sqls(on_attach)
dockerls(on_attach)
marksman(on_attach)
clangd(on_attach)
cmake(on_attach)

-- IMPORTANT: make sure to setup lua-dev BEFORE lspconfig
lua_dev.setup({})
sumneko_lua(on_attach)

M.on_attach_rust_tool = on_attach_rust_tool
return M
