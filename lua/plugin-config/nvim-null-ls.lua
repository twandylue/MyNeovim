local status_mason, mason = pcall(require, "mason")
if not status_mason then
  print("mason is not installed")
  return
end

local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("null-ls is not installed", vim.log.levels.ERROR)
  print("null-ls is not installed")
  return
end

local status_null_ls, mason_null_ls = pcall(require, "mason-null-ls")
if not status_null_ls then
  print("mason-null-ls is not installed")
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.black,
  b.formatting.csharpier,
  b.diagnostics.codespell,
  b.diagnostics.commitlint,
  b.diagnostics.gitlint,
  b.diagnostics.hadolint,
  b.diagnostics.markdownlint.with({
    -- disable limitation of line length
    extra_args = { "--disable", "MD013" },
  }),
  b.formatting.stylua.with({
    extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
  }),
  b.diagnostics.shellcheck,
  b.formatting.shellharden,
  b.diagnostics.yamllint.with({
    extra_args = { "-d", "{rules: {line-length: {max: 999}}}" },
  }),
}

if vim.fn.has("mac") == 1 then
  -- TODO: check luasnip
  -- table.insert(sources, null_ls.builtins.formatting.luasnip)
end

mason.setup({})

-- ref: https://docs.rockylinux.org/books/nvchad/custom/plugins/null_ls
-- for 'black' in Python, because there is no default formater in 'pyright'
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

null_ls.setup({
  debug = true,
  sources = sources,
  on_attach = on_attach,
})

mason_null_ls.setup({
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = false,
})
