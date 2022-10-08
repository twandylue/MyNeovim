local status_gruvbox, gruvbox = pcall(require, "gruvbox")
if not status_gruvbox then
  vim.notify("Color chemem: gruvbox is not installed")
  print("Color chemem: Gruvbox is not installed")
end
