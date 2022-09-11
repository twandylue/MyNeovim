local status, saga = pcall(require, "lspsaga")
if (not status) then
  print("lspsaga is not installed")
  return
end

saga.init_lsp_saga {
  server_filetype_map = {},
  code_action_lightbulb = { enable = false, },
}
