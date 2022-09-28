local status, sidebar = pcall(require, 'scrollbar')
if (not status) then
  vim.notify("scrollbar is not installed", "error")
  print("scrollbar is not installed")
  return
end

sidebar.setup();
