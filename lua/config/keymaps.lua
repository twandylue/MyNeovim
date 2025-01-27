-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key is whitespace
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

local function toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end
  if qf_exists == true then
    vim.cmd("cclose")
    return
  end
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  end
end

map("n", "<ESC>", ":nohlsearch<CR>", opts)
map("n", "<leader>s", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>m", "`", opts)
map("n", "<leader>f", function()
  toggle_qf()
end, opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "Q", "<nop>", opts)
map("i", "<C-f>", "<C-o>a", opts)
map("i", "<C-a>", "<Home>", opts)
map("i", "<C-e>", "<End>", opts)
map("i", "<C-d>", "<Delete>", opts)
map("i", "<M-d>", "<C-o>dw", opts)
-- keep copy text object in register
map("x", "<leader>p", '"_dP', opts)
map("n", "gj", "gT", { noremap = false })
map("n", "gk", "gt", { noremap = false })
if vim.g.vscode then
  map("n", "gj", "<Cmd>Tabprevious<CR>", { noremap = false })
  map("n", "gk", "<Cmd>Tabnext<CR>", { noremap = false })
end
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts)
-- map("n", "*", "*<C-o>", opts)
map("n", "<leader>w", "<C-W>", opts)

if vim.fn.has("mac") == 1 then
  -- move entire lines
  map("n", "<M-j>", ":m .+1<CR>", opts)
  map("n", "<M-k>", ":m .-2<CR>", opts)
  map("v", "<M-j>", ":m '>+1<CR>gv", opts)
  map("v", "<M-k>", ":m '<-2<CR>gv", opts)
  -- -- resize window
  map("n", "<M-Down>", ":resize -1<Enter>", opts)
  map("n", "<M-Up>", ":resize +1<Enter>", opts)
  map("n", "<M-Left>", ":vertical resize +1<Enter>", opts)
  map("n", "<M-Right>", ":vertical resize -1<Enter>", opts)
else
  -- in win
  -- move entire lines
  map("n", "<A-j>", ":m .+1<CR>", { noremap = false })
  map("n", "<A-k>", ":m .-2<CR>", { noremap = false })
  map("v", "<A-j>", ":m '>+1<CR>gv", { noremap = false })
  map("v", "<A-k>", ":m '<-2<CR>gv", { noremap = false })
  -- resize window
  map("n", "<A-->", ":vertical res -3<Enter>", opts)
  map("n", "<A-left>", ":vertical res +3<Enter>", opts)
  map("n", "<A-=>", ":vertical res +3<Enter>", opts)
  map("n", "<A-right>", ":vertical res -3<Enter>", opts)
end

-- easy-motion
map("n", "<leader>g/", "<Plug>(easymotion-sn)", opts)

-- basic lsp api
-- map("n", "<tab>d", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
-- map("n", "<tab>i", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
-- map("n", "<tab>u", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

-- vim-fugitive
map("n", "<leader>gg", "<Cmd>Gtabedit :<cr>", opts)

-- NOTE: Setting for Neovide
if vim.g.neovide then
  local keymap = vim.keymap.set

  local function neovideScale(amount)
    local temp = vim.g.neovide_scale_factor + amount

    if temp < 0.5 then
      return
    end

    vim.g.neovide_scale_factor = temp
  end

  keymap("n", "<D-=>", function()
    neovideScale(0.1)
  end)
  keymap("n", "<C-=>", function()
    neovideScale(0.1)
  end)

  keymap("n", "<D-->", function()
    neovideScale(-0.1)
  end)
  keymap("n", "<C-->", function()
    neovideScale(-0.1)
  end)

  keymap("i", "<D-d>", "<C-o>dw", opts)
  keymap("n", "<D-j>", ":m .+1<CR>", opts)
  keymap("n", "<D-k>", ":m .-2<CR>", opts)
  keymap("v", "<D-j>", ":m '>+1<CR>gv", opts)
  keymap("v", "<D-k>", ":m '<-2<CR>gv", opts)

  keymap("n", "<D-.>", "<Cmd>Lspsaga code_action<cr>", opts)
end
