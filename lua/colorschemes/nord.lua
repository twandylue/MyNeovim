local status, nord = pcall(require, "nord")
if not status then
  vim.notify("Color chemem: nord is not installed")
  print("Color chemem: nord is not installed")
  return
end
