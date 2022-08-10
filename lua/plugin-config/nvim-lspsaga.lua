local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', ',l', '<Cmd>Lspsaga show_line_diagnostics<cr>', opts)
vim.keymap.set('n', ',j', '<Cmd>Lspsaga show_cursor_diagnostics<cr>', opts)
vim.keymap.set('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', ',h', '<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<cr>', opts)
-- vim.keymap.set('n', ',s', '<Cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<cr>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<cr>', opts)
