local status, twilight = pcall(require, 'twilight')
if (not status) then
  print("twilight is not installed")
  return
end

twilight.setup {}
