local status, trouble = pcall(require, 'trouble')
if (not status) then
  vim.notify("trouble is not installed", "error")
  print("trouble is not installed")
  return
end

trouble.setup {}
