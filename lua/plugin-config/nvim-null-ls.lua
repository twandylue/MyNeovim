local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("null-ls is not installed", vim.log.levels.ERROR)
  print("null-ls is not installed")
  return
end

if vim.fn.has("mac") == 1 then
  null_ls.setup({
    sources = {
      -- install rustfrm: https://github.com/rust-lang/rustfmt
      -- through rustup: https://github.com/rust-lang/rustup
      null_ls.builtins.formatting.rustfmt,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.csharpier,
      null_ls.builtins.completion.luasnip,
    },
  })
else
  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.csharpier,
    },
  })
end
