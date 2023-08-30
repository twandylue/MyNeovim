local status, gitsigns = pcall(require, "gitsigns")
if not status then
  print("gitsigns is not installed")
  return
end

local opts = {
  noremap = true,
  silent = true,
}

-- gitsigns
-- <c-w>w => could focus on preview window
vim.api.nvim_set_keymap("n", "<leader>g]", "<cmd>Gitsigns next_hunk<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>g[", "<cmd>Gitsigns prev_hunk<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
vim.api.nvim_set_keymap("v", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gD", '<cmd>Gitsigns diffthis "~"<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>', opts)

gitsigns.setup({})
