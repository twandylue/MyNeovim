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
      vsplit = "<C-v>",
      split = "<C-s>",
      tabnew = "<C-t>",
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

local opts = {
  noremap = true,
  silent = true,
}

-- lspsaga
vim.api.nvim_set_keymap("n", "<tab>l", "<Cmd>Lspsaga show_line_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<tab>e", "<Cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>tl", "<Cmd>Lspsaga outline<cr>", opts)
vim.api.nvim_set_keymap("n", "]e", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
vim.api.nvim_set_keymap("n", "[e", "<Cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
vim.api.nvim_set_keymap("n", "<tab>h", "<Cmd>Lspsaga hover_doc<cr>", opts)
vim.api.nvim_set_keymap("n", "<tab>f", "<Cmd>Lspsaga finder<cr>", opts)
vim.api.nvim_set_keymap("n", "<tab>p", "<Cmd>Lspsaga peek_definition<cr>", opts)
vim.api.nvim_set_keymap("n", "<tab>r", "<Cmd>Lspsaga rename<cr>", opts)

if vim.fn.has("mac") == 1 then
  vim.api.nvim_set_keymap("n", "<M-.>", "<Cmd>Lspsaga code_action<cr>", opts)
else
  vim.api.nvim_set_keymap("n", "<A-.>", "<Cmd>Lspsaga code_action<cr>", opts)
end
