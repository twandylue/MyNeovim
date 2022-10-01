local status, impatient = pcall(require, 'impatient')
if (not status) then
  print("impatient is not installed")
  return
end

impatient.enable_profile()
