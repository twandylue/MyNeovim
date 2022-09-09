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

local opts = {
  noremap = true,
  silent = true,
}

-- indent mark
-- vim.opts.list = true
-- vim.opts.listchars:append "eol:↴"

-- local variable
local map = vim.api.nvim_set_keymap

-- TODO: remove trailing white space
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   command = [[%s/\s\+$//e]],
-- })

map("n", ",<space>", ":nohlsearch<CR>", { noremap = false })
map("n", "<leader>fs", ":w<CR>", { noremap = false })
map("n", "<leader>q", ":q<CR>", { noremap = false })
map("n", "<leader>m", "`", { noremap = false })
map("n", "<S-h>", "^", { noremap = false })
map("n", "<S-l>", "g_", { noremap = false })
-- used by bufferline
-- map("n", "gj", "gT", { noremap = false })
-- map("n", "gk", "gt", { noremap = false })

-- 已經用 zh and zj
-- map("n", "<C-h>", "<C-W>h", { noremap = false })
-- map("n", "<C-l>", "<C-W>l", { noremap = false })

map("", "<leader>wh", "<C-W>h", { noremap = false })
map("", "<leader>wj", "<C-W>j", { noremap = false })
map("", "<leader>wk", "<C-W>k", { noremap = false })
map("", "<leader>wl", "<C-W>l", { noremap = false })
map("", "<leader>ww", "<C-W>w", { noremap = false })

-- In my Mac, option + j => ∆
-- map("n", "∆", ":tabnew<CR>", { noremap = false })

-- used by move lines
-- map("n", "<C-j>", "<C-W>j", { noremap = false })
-- map("n", "<C-k>", "<C-W>k", { noremap = false })
map("n", "<C-j>", ":m .+1<CR>", { noremap = false })
map("n", "<C-k>", ":m .-2<CR>", { noremap = false })
map("v", "<C-j>", ":m '>+1<CR>gv", { noremap = false })
map("v", "<C-k>", ":m '<-2<CR>gv", { noremap = false })
-- resize window
map("n", "<M-=>", ":vertical res +3<Enter>", { noremap = false })
map("n", "<M-->", ":vertical res -3<Enter>", { noremap = false })

map("i", "jj", "<Esc>", { noremap = false })

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- gitsigns
-- <c-w>w => could focus on preview window
map('n', '<leader>gj', '<cmd>Gitsigns next_hunk<CR>', opts)
map('n', '<leader>gk', '<cmd>Gitsigns prev_hunk<CR>', opts)
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

-- TODO: dont work
-- require('gitsigns').setup{
--   ...
--   on_attach = function(bufnr)
--     local gs = package.loaded.gitsigns
--
--     local function map(mode, l, r, opts)
--       opts = opts or {}
--       opts.buffer = bufnr
--       vim.keymap.set(mode, l, r, opts)
--     end
--
--     -- Actions
--     map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
--     map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
--     map('n', '<leader>hS', gs.stage_buffer)
--     map('n', '<leader>hu', gs.undo_stage_hunk)
--     map('n', '<leader>hR', gs.reset_buffer)
--     map('n', '<leader>hp', gs.preview_hunk)
--     map('n', '<leader>hb', function() gs.blame_line{full=true} end)
--     map('n', '<leader>tb', gs.toggle_current_line_blame)
--     map('n', '<leader>hd', gs.diffthis)
--     map('n', '<leader>hD', function() gs.diffthis('~') end)
--     map('n', '<leader>td', gs.toggle_deleted)
--
--     -- Text object
--     map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
--   end
-- }

require 'hop'.setup {
  vim.api.nvim_set_keymap("n", "<leader>/", "<Cmd>HopPattern<CR>", { silent = true }),
  vim.api.nvim_set_keymap("n", "gss", "<Cmd>HopChar2<CR>", { silent = true }),
}

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
map('n', ']h', '<Cmd>Lspsaga hover_doc<cr>', opts)
map('n', 'gf', '<Cmd>Lspsaga lsp_finder<cr>', opts)
map('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
map('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
-- map('n', ',s', '<Cmd>Lspsaga signature_help<cr>', opts)

-- neogit
map('n', '<leader>gg', '<Cmd>Neogit<cr>', opts)
