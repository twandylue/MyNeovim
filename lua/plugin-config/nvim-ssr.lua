local status, ssr = pcall(require, "ssr")
if not status then
  vim.notify("ssr is not installed", vim.log.levels.ERROR)
  print("ssr is not installed")
  return
end

ssr.setup({
  min_width = 50,
  min_height = 5,
  keymaps = {
    close = "q",
    next_match = "n",
    prev_match = "N",
    replace_all = "<leader><cr>",
  },
})
