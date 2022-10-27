local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  print("fidget is not installed")
  return
end

fidget.setup()
