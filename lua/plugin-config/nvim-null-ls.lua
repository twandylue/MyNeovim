local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("null-ls is not installed", vim.log.levels.ERROR)
  print("null-ls is not installed")
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
  -- null_ls.builtins.completion.spell,
  -- null_ls.builtins.diagnostics.write_good,
}

if vim.fn.has("mac") == 1 then
  -- NOTE: rustfmt is builtin in rustup
  -- table.insert(sources, null_ls.builtins.formatting.rustfmt)
  -- TODO: check luasnip
  -- table.insert(sources, null_ls.builtins.formatting.luasnip)
end

null_ls.setup({
  sources = sources,
})
