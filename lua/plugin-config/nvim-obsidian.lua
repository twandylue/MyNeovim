local status, obsidian = pcall(require, "obsidian")
if not status then
  vim.notify("obsidian is not installed", vim.log.levels.ERROR)
  print("null-ls is not installed")
  return
end

obsidian.setup({
  dir = "~/Documents/MyNotes",
  completion = {
    nvim_cmp = true,
  },
})
