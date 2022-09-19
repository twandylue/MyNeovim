local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  vim.notify("lsp_signature is not installed", "error")
  print("lsp_signature is not installed")
  return
end

lsp_signature.setup({
  bind = true,
  doc_lines = 10,
  hint_prefix = " ",
  handler_opts = { border = 'rounded' },
  hi_parameter = "IncSearch",
  -- fix_pos = true,
  -- move_cursor_key = '<space>',
  -- close_timeout = 4000,
  -- toggle_key = '<M-i>', -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x
})
