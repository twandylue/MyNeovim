local status, cursor = pcall(require, "smoothcursor")
if not status then
	vim.notify("smooth-cursor is not installed", vim.log.levels.ERROR)
	print("smooth-cursor is not installed")
	return
end

cursor.setup({
	autostart = false,
	fancy = {
		enable = true, -- enable fancy mode
	},
})
