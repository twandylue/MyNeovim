local status, surround = pcall(require, "nvim-surround")
if not status then
	print("nvim-surround is not installed")
	return
end

surround.setup({})
