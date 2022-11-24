local status, glance = pcall(require, "glance")
if not status then
  print("glance is not installed")
  return
end

local actions = glance.actions
glance.setup({
  height = 22, -- Height of the windo
  mappings = {
    list = {
      ["<C-u>"] = actions.preview_scroll_win(3),
      ["<C-d>"] = actions.preview_scroll_win(-3),
    },
  },
})
