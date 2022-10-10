local status_gruvbox, gruvbox = pcall(require, "gruvbox")
if not status_gruvbox then
  vim.notify("Color chemem: gruvbox is not installed")
  print("Color chemem: gruvbox is not installed")
  return
end

gruvbox.setup({
  contrast = "true", -- can be "hard", "soft" or empty string
})
