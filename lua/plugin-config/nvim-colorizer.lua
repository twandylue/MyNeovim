local status, colorizer = pcall(require, "colorizer")
if not status then
	vim.notify("colorizer is not installed", vim.log.levels.ERROR)
	print("colorizer is not installed")
	return
end

-- Attaches to every FileType mode
colorizer.setup()
