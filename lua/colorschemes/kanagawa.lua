local status_kanagawa, kanagawa = pcall(require, "kanagawa")
if not status_kanagawa then
  vim.notify("Color chemem: kanagawa is not installed")
  print("Color chemem: kanagawa is not installed")
  return
end

kanagawa.setup()
