local status_github, github = pcall(require, "github-theme")
if not status_github then
  vim.notify("Color chemem: github-theme is not installed")
  print("Color chemem: github-theme is not installed")
  return
end

github.setup({
  comment_style = "NONE",
  keyword_style = "NONE",
  function_style = "italic",
  -- function_style = "NONE",
  variable_style = "NONE",
  colors = {
    cursor_line_nr = "#FF0033",
    bg_search = "#9D0006",
    hint = "orange",
    error = "#ff0000",
  },
})
