local status, netrw = pcall(require, "netrw")
if not status then
  vim.notify("netrw is not installed", vim.log.levels.ERROR)
  print("netrw is not installed")
  return
end

netrw.setup({
  icons = {
    symlink = "", -- Symlink icon (directory and file)
    directory = "", -- Directory icon
    file = "", -- File icon
  },
  use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
  mappings = {}, -- Custom key mappings
})
