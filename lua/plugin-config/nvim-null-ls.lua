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

local sources = {
  null_ls.builtins.formatting.stylua.with({
    extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
  }),
  null_ls.builtins.formatting.csharpier,
  null_ls.builtins.diagnostics.markdownlint.with({
    -- disable limitation of line length
    extra_args = { "--disable", "MD013" },
  }),
  null_ls.builtins.diagnostics.shellcheck,
  null_ls.builtins.diagnostics.yamllint.with({
    extra_args = { "-d", "{rules: {line-length: {max: 999}}}" },
  }),
}

if vim.fn.has("mac") == 1 then
  -- TODO: check luasnip
  -- table.insert(sources, null_ls.builtins.formatting.luasnip)
end

mason.setup({})

null_ls.setup({
  sources = sources,
})

mason_null_ls.setup({
  ensure_installed = nil,
  automatic_installation = true,
  automatic_setup = false,
})
