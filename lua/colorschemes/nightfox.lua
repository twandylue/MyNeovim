local status, nightfox = pcall(require, "nightfox")
if not status then
  vim.notify("Color chemem: nightfox is not installed")
  print("Color chemem: nightfox is not installed")
end

nightfox.setup()
