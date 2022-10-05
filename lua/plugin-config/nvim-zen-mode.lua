local status, zen = pcall(require, "zen-mode")
if not status then
	vim.notify("zen-mode is not installed", vim.log.levels.ERROR)
	print("zen-mode is not installed")
	return
end

zen.setup({})
