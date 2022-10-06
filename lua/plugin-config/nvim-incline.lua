local status, incline = pcall(require, "incline")
if not status then
	vim.notify("incline is not installed", vim.log.levels.ERROR)
	print("incline is not installed")
	return
end

incline.setup({})
