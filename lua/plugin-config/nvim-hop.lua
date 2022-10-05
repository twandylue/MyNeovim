local status, hop = pcall(require, "hop")
if not status then
	print("hop is not installed")
	return
end

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})
