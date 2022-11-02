local status, winsep = pcall(require, "colorful-winsep")
if not status then
  vim.notify("colorful-winsep is not installed", vim.log.levels.ERROR)
  print("colorful-winsep is not installed")
  return
end

winsep.setup({
  highlight = {
    guifg = "#FF2D21",
  },
})
