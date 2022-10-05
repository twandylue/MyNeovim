local status, aerial = pcall(require, "aerial")
if not status then
	print("aerial is not installed")
	return
end

aerial.setup()
