-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- indent mark
-- vim.opts.list = true
-- vim.opts.listchars:append "eol:↴"

-- TODO: remove trailing white space
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   command = [[%s/\s\+$//e]],
-- })

local map = vim.api.nvim_set_keymap
local opts = {
  noremap = true,
  silent = true,
}

map("n", "<ESC>", ":nohlsearch<CR>", opts)
map("n", "<leader>fs", ":w<CR>", opts)
map("n", "<leader>s", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>m", "`", opts)
map("n", "<S-h>", "^", opts)
map("n", "<S-l>", "g_", opts)
-- keep copy text object in register
map("x", "<leader>p", "\"_dP", opts)
-- used by bufferline
-- map("n", "gj", "gT", { noremap = false })
-- map("n", "gk", "gt", { noremap = false })

map("", "<leader>w", "<C-W>", opts)
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

-- TODO: Mac
-- map("n", "<M-j>", ":m .+1<CR>", opts)
-- map("n", "<M-k>", ":m .-2<CR>", opts)
-- map("v", "<M-j>", ":m '>+1<CR>gv", opts)
-- map("v", "<M-k>", ":m '<-2<CR>gv", opts)
-- -- resize window
-- map("n", "<M-->", ":vertical res -3<Enter>", opts)
-- map("n", "<M-left>", ":vertical res +3<Enter>", opts)
-- map("n", "<M-=>", ":vertical res +3<Enter>", opts)
-- map("n", "<M-right>", ":vertical res -3<Enter>", opts)

map("i", "jj", "<Esc>", { noremap = false })

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- gitsigns
-- <c-w>w => could focus on preview window
map('n', '<leader>g]', '<cmd>Gitsigns next_hunk<CR>', opts)
map('n', '<leader>g[', '<cmd>Gitsigns prev_hunk<CR>', opts)
map('n', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', opts)
map('v', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>', opts)
map('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', opts)
map('v', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>', opts)
map('n', '<leader>gS', '<cmd>Gitsigns stage_buffer<CR>', opts)
map('n', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts)
map('n', '<leader>gR', '<cmd>Gitsigns reset_buffer<CR>', opts)
map('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>', opts)
map('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>', opts)
map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)
map('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>', opts)
map('n', '<leader>gD', '<cmd>Gitsigns diffthis "~"<CR>', opts)
-- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', opts)

require 'hop'.setup {
  vim.api.nvim_set_keymap("n", "gs/", "<Cmd>HopPattern<CR>", { silent = true }),
  vim.api.nvim_set_keymap("n", "gss", "<Cmd>HopChar2<CR>", { silent = true }),
}

-- telescope
require('telescope').setup {
  -- map('n', '<leader>.', "<cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<CR>", opts),
  map('n', '<leader>.', "<cmd>lua require('telescope.builtin').find_files({preview = true})<CR>", opts),
  map('n', '<leader>g.', "<cmd>lua require('telescope.builtin').git_files({preview = true})<CR>", opts),
  map('n', '[g', '<cmd>lua require("telescope.builtin").live_grep({preview = true})<CR>', opts),
  map('n', '<leader>,', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts),
  map('n', '[t', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts),
  map('n', '[r', '<cmd>lua require("telescope.builtin").resume()<CR>', opts),
  map('n', '[d', '<cmd>lua require("telescope.builtin").diagnostics()<CR>', opts),
  map('n', 'tf',
    '<cmd>lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 50 } })<CR>'
    , opts),
}
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  ":lua require'telescope'.extensions.project.project{}<CR>",
  opts
)

require('bufferline').setup {
  -- These commands will navigate through buffers in order regardless of which mode you are using
  -- e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
  map('n', 'gk', '<cmd>BufferLineCycleNext<CR>', opts),
  map('n', 'gj', '<cmd>BufferLineCyclePrev<CR>', opts),

  -- These commands will move the current buffer backwards or forwards in the bufferline
  map('n', 'gK', '<cmd>BufferLineMoveNext<CR>', opts),
  map('n', 'gJ', '<cmd>BufferLineMovePrev<CR>', opts),

  map('n', 'gP', '<cmd>BufferLineTogglePin<CR>', opts),
  -- map('n', 'gl', '<cmd>BufferLinePick<CR>', opts),

  -- close buffer tab
  map('n', '<leader>bk', '<cmd>bdelete<CR>', opts),

  -- These commands will sort buffers by directory, language, or a custom criteria
  -- nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
  -- map('n', 'be', '<cmd>BufferLineSortByExtension<CR>', opts),
  -- map('n', 'bd', '<cmd>BufferLineSortByDirectory<CR>', opts),
}

-- lspsaga
map('n', '[l', '<Cmd>Lspsaga show_line_diagnostics<cr>', opts)
map('n', '[c', '<Cmd>Lspsaga show_cursor_diagnostics<cr>', opts)
map('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
map('n', '[e', '<Cmd>Lspsaga diagnostic_jump_prev<cr>', opts)
map('n', '<tab>h', '<Cmd>Lspsaga hover_doc<cr>', opts)
map('n', '<tab>f', '<Cmd>Lspsaga lsp_finder<cr>', opts)
map('n', '<tab>p', '<Cmd>Lspsaga peek_definition<cr>', opts)
map('n', '<tab>r', '<Cmd>Lspsaga rename<cr>', opts)
map('n', '<A-.>', '<Cmd>Lspsaga code_action<cr>', opts)
-- TODO: Mac
map('n', '<M-.>', '<Cmd>Lspsaga code_action<cr>', opts)

-- neogit
map('n', '<leader>gg', '<Cmd>Neogit<cr>', opts)

-- toggleterm
function _G.set_terminal_keymaps()
  local termOpts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], termOpts)
  vim.keymap.set('t', '<C-[>', [[<Esc>]], termOpts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], termOpts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], termOpts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], termOpts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], termOpts)
end

-- TODO: Mac
-- vim.keymap.set('n', '<M-\\>', [[<Cmd>ToggleTerm dir=%:p:h<CR>]], opts) -- open terminal on current directory
vim.keymap.set('n', '<A-\\>', [[<Cmd>ToggleTerm dir=%:p:h<CR>]], opts)
vim.keymap.set('n', '<C-\\>', [[<Cmd>ToggleTerm<CR>]], opts) -- open terminal on current root path(neovim)

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
