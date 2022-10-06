local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("null-ls is not installed", vim.log.levels.ERROR)
  print("null-ls is not installed")
  return
end

local sources = {
  null_ls.builtins.formatting.stylua.with({
    extra_args = { "--indent-type", "Spaces" }
  }),
  null_ls.builtins.formatting.csharpier,
}

if vim.fn.has("mac") == 1 then
  table.insert(sources, null_ls.builtins.formatting.rustfmt)
  table.insert(sources, null_ls.builtins.formatting.luasnip)
end

null_ls.setup(sources)
