local status, mason = pcall(require, "mason")
if not status then
  print("mason is not installed")
  return
end

local status_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_lspconfig then
  print("mason-lspconfig is not installed")
  return
end

mason.setup({})

mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "bashls",
    "clangd",
    "csharp_ls",
    "dockerls",
    "jsonls",
    "pyright",
    "rust_analyzer",
    -- "sqls",
    "lua_ls",
    "tsserver",
    "yamlls",
  },
})
