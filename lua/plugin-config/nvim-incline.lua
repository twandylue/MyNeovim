local status, incline = pcall(require, 'incline')
if (not status) then
  vim.notify("incline is not installed", "error")
  print("incline is not installed")
  return
end

incline.setup {}
