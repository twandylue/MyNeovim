local status_null_ls, mason_null_ls = pcall(require, "mason-null-ls")
if not status_null_ls then
  print("mason-null-ls is not installed")
  return
end

-- Primary source is `null-ls`
-- ref: https://github.com/jay-babu/mason-null-ls.nvim#primary-source-of-truth-is-null-ls
mason_null_ls.setup({
  ensure_installed = {},
  automatic_installation = true,
  automatic_setup = false,
})
