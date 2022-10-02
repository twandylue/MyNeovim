local status, neorg = pcall(require, 'neorg')
if (not status) then
  vim.notify("neorg is not installed", "error")
  print("neorg is not installed")
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
  }
}
