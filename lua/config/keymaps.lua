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

local map = vim.api.nvim_set_keymap
local opts = {
  noremap = true,
  silent = true,
}

map("n", "<ESC>", ":nohlsearch<CR>", opts)
map("n", "<leader>fs", ":w | :e<CR>", opts)
map("n", "<leader>s", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>m", "`", opts)
map("n", "<S-h>", "^", opts)
map("n", "<S-l>", "g_", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "Q", "<nop>", opts)
map("i", "<C-o>", "<C-o>a", opts)
-- keep copy text object in register
map("x", "<leader>p", '"_dP', opts)
map("n", "gj", "gT", { noremap = false })
map("n", "gk", "gt", { noremap = false })
map("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

map("", "<leader>w", "<C-W>", opts)

if vim.fn.has("mac") == 1 then
  -- move entire lines
  map("n", "<M-j>", ":m .+1<CR>", opts)
  map("n", "<M-k>", ":m .-2<CR>", opts)
  map("v", "<M-j>", ":m '>+1<CR>gv", opts)
  map("v", "<M-k>", ":m '<-2<CR>gv", opts)
  -- -- resize window
  map("n", "<M-->", ":vertical res -3<Enter>", opts)
  map("n", "<M-left>", ":vertical res +3<Enter>", opts)
  map("n", "<M-=>", ":vertical res +3<Enter>", opts)
  map("n", "<M-right>", ":vertical res -3<Enter>", opts)
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

map("i", "jj", "<Esc>", { noremap = false })

-- With Plugins
-- nvim-tree
-- map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- vinegar style.
-- map("n", "<leader>e", "<cmd>lua require'nvim-tree'.open_replacing_current_buffer()<CR>", opts)
-- map("n", "<leader>e", "<cmd>Sexplore<CR>", opts)
map("n", "<leader>e", "<cmd>Oil<CR>", opts)
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- gitsigns
-- <c-w>w => could focus on preview window
map("n", "<leader>g]", "<cmd>Gitsigns next_hunk<CR>", opts)
map("n", "<leader>g[", "<cmd>Gitsigns prev_hunk<CR>", opts)
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts)
map("v", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts)
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
map("v", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", opts)
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", opts)
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", opts)
map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", opts)
map("n", "<leader>gD", '<cmd>Gitsigns diffthis "~"<CR>', opts)
-- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', opts)

-- easy-motion
map("n", "<leader>g/", "<Plug>(easymotion-sn)", opts)

-- Telescope
-- map('n', '<leader>.', "<cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<CR>", opts)
map("n", "<leader>.", "<cmd>lua require('telescope.builtin').find_files({preview = true})<CR>", opts)
map("n", "<leader>g.", "<cmd>lua require('telescope.builtin').git_files({preview = true})<CR>", opts)
map("n", "[g", '<cmd>lua require("telescope.builtin").live_grep({preview = true})<CR>', opts)
map("n", "[fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", opts)
map("n", "[s", '<cmd>lua require("telescope.builtin").grep_string({preview = true})<CR>', opts)
map("n", "<leader>,", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
map("n", "[t", '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
map("n", "[r", '<cmd>lua require("telescope.builtin").resume()<CR>', opts)
map("n", "[d", '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts)
map(
  "n",
  "tf",
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 50 } })<CR>'
  ,
  opts
)
vim.api.nvim_set_keymap("n", "<C-p>", ":lua require'telescope'.extensions.project.project{}<CR>", opts)

-- bufferline
map("n", "gK", "<cmd>BufferLineMoveNext<CR>", opts)
map("n", "gJ", "<cmd>BufferLineMovePrev<CR>", opts)
map("n", "gP", "<cmd>BufferLineTogglePin<CR>", opts)

-- lspsaga
map("n", "<tab>l", "<Cmd>Lspsaga show_line_diagnostics<cr>", opts)
map("n", "<tab>e", "<Cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
map("n", "<leader>t", "<Cmd>Lspsaga outline<cr>", opts)
map("n", "]e", "<Cmd>Lspsaga diagnostic_jump_next<cr>", opts)
map("n", "[e", "<Cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
map("n", "<tab>h", "<Cmd>Lspsaga hover_doc<cr>", opts)
map("n", "<tab>f", "<Cmd>Lspsaga lsp_finder<cr>", opts)
map("n", "<tab>p", "<Cmd>Lspsaga peek_definition<cr>", opts)
map("n", "<tab>r", "<Cmd>Lspsaga rename<cr>", opts)

-- basic lsp api with glance.nvim
map("n", "<tab>d", "<cmd>Glance definitions<cr>", opts)
map("n", "<tab>i", "<cmd>Glance implementations<cr>", opts)
map("n", "<tab>u", "<cmd>Glance references<cr>", opts)

-- basic lsp api
-- map("n", "<tab>d", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
-- map("n", "<tab>i", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
-- map("n", "<tab>u", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

if vim.fn.has("mac") == 1 then
  map("n", "<M-.>", "<Cmd>Lspsaga code_action<cr>", opts)
else
  map("n", "<A-.>", "<Cmd>Lspsaga code_action<cr>", opts)
end

-- neogit
-- map("n", "<leader>gg", "<Cmd>Neogit<cr>", opts)

-- vim-fugitive
map("n", "<leader>gg", "<Cmd>Gtabedit :<cr>", opts)

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

-- Rest(httpclient) (TODO: should consider filetype)
map("n", "<leader>cc", "<Plug>RestNvim", opts)
