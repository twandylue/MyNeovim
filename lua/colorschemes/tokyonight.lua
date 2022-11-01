local status, tokyonight = pcall(require, "tokyonight")
if not status then
  vim.notify("Color chemem: tokyonight is not installed")
  print("Color chemem: tokyonight is not installed")
  return
end

tokyonight.setup({
  -- style = "night"
  styles = {
    functions = { italic = true },
  },
  dim_inactive = true,
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end
})
