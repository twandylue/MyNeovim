local status, noice = pcall(require, "noice")
if not status then
  vim.notify("noice is not installed", vim.log.levels.ERROR)
  print("noice is not installed")
  return
end

noice.setup()
