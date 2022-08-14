local status, substitute = pcall(require, 'substitute')
if (not status) then
  print("substitute is not installed")
  return
end

substitute.setup {}
