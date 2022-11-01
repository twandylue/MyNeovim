local status, leap = pcall(require, "leap")
if not status then
  print("leap is not installed")
  return
end

leap.add_default_mappings()
