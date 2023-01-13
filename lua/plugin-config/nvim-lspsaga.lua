local status, saga = pcall(require, "lspsaga")
if not status then
  print("lspsaga is not installed")
  return
end

saga.setup({
  server_filetype_map = {},
  code_action_lightbulb = { enable = false },
  border_style = "rounded",
  finder_action_keys = {
    open = "<Enter>",
    vsplit = "<C-v>",
    split = "<C-s>",
    tabe = "t",
    quit = "q",
  },
  symbol_in_winbar = {
    enable = true,
    in_custom = false,
  },
})
