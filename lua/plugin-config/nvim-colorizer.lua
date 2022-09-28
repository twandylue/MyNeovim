local status, colorizer = pcall(require, 'colorizer')
if (not status) then
  vim.notify("colorizer is not installed", "error")
  print("colorizer is not installed")
  return
end

colorizer.setup {}
