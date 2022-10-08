local status_github, github = pcall(require, "github-theme")
if not status_github then
  vim.notify("Color chemem: github-theme is not installed")
  print("Color chemem: github-theme is not installed")
end

github.setup({
  comment_style = "NONE",
  keyword_style = "NONE",
  function_style = "italic",
  -- function_style = "NONE",
  variable_style = "NONE",
})