local status_catppuccin, catppuccin = pcall(require, "catppuccin")
if not status_catppuccin then
  vim.notify("Color chemem: catppuccin is not installed")
  print("Color chemem: catppuccin is not installed")
  return
end

catppuccin.setup()
