local status, tokyonight = pcall(require, "tokyonight")
if not status then
  vim.notify("Color chemem: tokyonight is not installed")
  print("Color chemem: tokyonight is not installed")
end

tokyonight.setup()
