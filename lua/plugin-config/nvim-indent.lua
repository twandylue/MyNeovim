local status, blankline = pcall(require, 'indent_blankline')
if (not status) then
  print("indent_blankline is not installed")
  return
end

blankline.setup {
  show_current_context = true,
  -- show_current_context_start = true,
  show_end_of_line = true,
  -- space_char_blankline = " ",
  indent_blankline_use_treesitter = true,
}
