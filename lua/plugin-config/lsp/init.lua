local bashls = require("plugin-config.lsp.configs.bashls")
-- local csharp_ls = require("plugin-config.lsp.configs.csharp_ls")
local clangd = require("plugin-config.lsp.configs.clangd")
local dockerls = require("plugin-config.lsp.configs.dockerls")
local jsonls = require("plugin-config.lsp.configs.jsonls")
local pyright = require("plugin-config.lsp.configs.pyright")
local rust = require("plugin-config.lsp.configs.rust")
-- local sqls = require("plugin-config.lsp.configs.sqls")
local lua_ls = require("plugin-config.lsp.configs.lua_ls")
local tsserver = require("plugin-config.lsp.configs.tsserver")
local yamlls = require("plugin-config.lsp.configs.yamlls")

local inlay_hinter = require("inlay-hints")

local status_neodev, lua_dev = pcall(require, "neodev")
if not status_neodev then
  print("neodev is not installed")
  return
end

local status, navbuddy = pcall(require, "nvim-navbuddy")
if not status then
  print("nvim-navbuddy is not installed")
  return
end

local on_attach_rust_tool = function(client, bufnr)
  navbuddy.attach(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    -- NOTE: ref: https://neovim.discourse.group/t/vimscript-autocmd-to-lua/2932/4
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        local current_clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #current_clients >= 1 then
          vim.lsp.buf.format()
        end
      end,
      group = vim.api.nvim_create_augroup("lsp_document_format", { clear = true }),
    })
  end
end

local on_attach = function(client, bufnr)
  navbuddy.attach(client, bufnr)
  inlay_hinter.on_attach(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    -- formatting with default formatter in lsp
    -- NOTE: ref: https://neovim.discourse.group/t/vimscript-autocmd-to-lua/2932/4
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function()
        local current_clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #current_clients >= 1 then
          vim.lsp.buf.format()
        end
      end,
      group = vim.api.nvim_create_augroup("lsp_document_format", { clear = true }),
    })
  end
end

rust(on_attach_rust_tool)
yamlls(on_attach)
jsonls(on_attach)
tsserver(on_attach)
bashls(on_attach)
-- csharp_ls(on_attach)
pyright(on_attach)
-- sqls(on_attach)
dockerls(on_attach)
clangd(on_attach)

-- NOTE: (IMPORTANT)make sure to setup lua-dev BEFORE lspconfig
lua_dev.setup({})
lua_ls(on_attach)

local M = {
  on_attach_rust_tool = on_attach_rust_tool,
}
return M
