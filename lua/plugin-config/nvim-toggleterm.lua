local status, toggleterm = pcall(require, "toggleterm")
if not status then
  print("toggleterm is not installed")
  return
end

-- change default terminal as in win
if vim.fn.has("win32") == 1 then
  local powershell_options = {
    shell = vim.fn.executable("powershell") and "powershell" or "pwsh",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = false,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "tab",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local opts = {
  noremap = true,
  silent = true,
}

-- Toggleterm
function _G.set_terminal_keymaps()
  local termOpts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], termOpts)
  vim.keymap.set("t", "<C-[>", [[<Esc>]], termOpts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], termOpts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], termOpts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], termOpts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], termOpts)
end

if vim.fn.has("mac") == 1 then
  vim.keymap.set("n", "<M-\\>", [[<Cmd>ToggleTerm dir=%:p:h<CR>]], opts) -- open terminal on current directory
else
  vim.keymap.set("n", "<A-\\>", [[<Cmd>ToggleTerm dir=%:p:h<CR>]], opts)
end

vim.keymap.set("n", "<C-\\>", [[<Cmd>ToggleTerm<CR>]], opts) -- open terminal on current root path(neovim)

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
