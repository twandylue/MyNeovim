local status, navbuddy = pcall(require, "nvim-navbuddy")
if not status then
  print("nvim-navbuddy is not installed")
  return
end

navbuddy.setup({
  window = {
    border = "double", -- "single", "rounded", "double", "solid", "none"
    size = "90%",
    position = "50%",
  },
})
