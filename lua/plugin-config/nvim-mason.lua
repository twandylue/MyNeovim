local status, mason = pcall(require, "mason")
if not status then
  print("mason is not installed")
  return
end

local status2, masonLspconfig = pcall(require, "mason-lspconfig")
if not status2 then
  print("mason-lspconfig is not installed")
  return
end

mason.setup({})

masonLspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "bashls",
    "clangd",
    -- "csharp_ls",
    "dockerls",
    "jsonls",
    "marksman",
    "pyright",
    "rust_analyzer",
    -- "sqls",
    "sumneko_lua",
    "tsserver",
    "yamlls",
  },
})
