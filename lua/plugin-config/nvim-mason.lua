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
    "bash-language-server",
    "clangd",
    "cmake-language-server",
    "csharp-language-server",
    "csharpier",
    "css-lsp",
    "cssmodules-language-server",
    "dockerfile-language-server",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "markdownlint",
    "marksman",
    "omnisharp",
    "omnisharp-mono",
    "pyright",
    "rust-analyzer",
    "shellcheck",
    "sqls",
    "stylua",
    "typescript-language-server",
    "vim-language-server",
    "yaml-language-server",
    "yamllint",
  },
})
