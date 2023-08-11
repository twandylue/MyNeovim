local status, lint = pcall(require, "lint")
if not status then
  print("nvim-lint is not installed")
  return
end

-- NOTE: use the linter in LSP: sh, yaml,
lint.linters_by_ft = {
  markdown = { "markdownlint" },
}

-- NOTE: lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
