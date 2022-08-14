local status, blankline = pcall(require, 'indent_blankline')
if (not status) then
  print("indent_blankline is not installed")
  return
end

blankline.setup {
  show_end_of_line = true,
}
