local status, trouble = pcall(require, "trouble")
if not status then
	vim.notify("trouble is not installed", vim.log.levels.ERROR)
	print("trouble is not installed")
	return
end

trouble.setup({})
