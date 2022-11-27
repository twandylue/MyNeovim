local status, hints = pcall(require, "inlay-hints")
if not status then
  print("inlay-hints is not installed")
  return
end

hints.setup({
  only_current_line = true,

  eol = {
    right_align = true,
  },
})
