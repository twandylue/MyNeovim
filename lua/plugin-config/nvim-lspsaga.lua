local status, saga = pcall(require, "lspsaga")
if not status then
  print("lspsaga is not installed")
  return
end

saga.setup({
  preview = {
    lines_above = 0,
    lines_below = 20,
  },
  lightbulb = {
    enable = false,
  },
  outline = {
    keys = {
      jump = "<Enter>",
      expand_collapse = "-",
      quit = "q",
    },
  },
  code_action = {
    num_shortcut = false,
    keys = {
      quit = "q",
      exec = "<CR>",
    },
  },
  border_style = "rounded",
  finder = {
    edit = { "o", "<CR>" },
    vsplit = "<C-v>",
    split = "<C-s>",
    tabe = "<C-t>",
    quit = { "q", "<ESC>" },
  },
  symbol_in_winbar = {
    enable = true,
  },
})
