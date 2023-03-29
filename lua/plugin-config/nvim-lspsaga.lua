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
    win_width = 40,
    keys = {
      expand_collapse = "o",
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
    keys = {
      expand_or_jump = "<CR>",
      vsplit = "<C-v>",
      split = "<C-s>",
      tabe = "<C-t>",
      quit = { "q", "<ESC>" },
    },
  },
  symbol_in_winbar = {
    enable = true,
    separator = " > ",
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = true,
  },
  definition = {
    edit = "<CR>",
    vsplit = "<C-v>",
    split = "<C-s>",
    tabe = "<C-t>",
    quit = "q",
    close = "<Esc>",
  },
  rename = {
    quit = "<C-c>",
    exec = "<CR>",
    mark = "x",
    confirm = "<CR>",
    in_select = true,
  },
})
