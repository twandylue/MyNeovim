local status, gitblame = pcall(require, "gitblame")
if not status then
	print("gitblame is not installed")
	return
end

local g = vim.g
g.gitblame_enabled = 0
