local diag_enabled = true

-- NOTE: ref: LazyVim/toggle.lua
-- https://github.com/LazyVim/LazyVim
local toggle_diagnostic = function()
  -- if this Neovim version supports checking if diagnostics are diag_enabled
  -- then use that for the current state
  if vim.diagnostic.is_disabled then
    diag_enabled = not vim.diagnostic.is_disabled()
  end
  diag_enabled = not diag_enabled

  if diag_enabled then
    vim.diagnostic.enable()
    print("Diagnostic is enabled")
  else
    vim.diagnostic.disable()
    print("Diagnostic is disabled")
  end
end

local tsc_enabled = true
-- NOTE: ref: LazyVim/treesitter.lua
-- https://github.com/LazyVim/LazyVim
local toggle_treesitter = function()
  local tsc = require("treesitter-context")
  tsc.toggle()
  tsc_enabled = not tsc_enabled
  if tsc_enabled == true then
    print("Treesitter Context is enabled")
  else
    print("Treesitter Context is disabled")
  end
end

vim.api.nvim_create_user_command("ToggleDiagnostic", toggle_diagnostic, {})
vim.api.nvim_create_user_command("ToggleTreesitter", toggle_treesitter, {})
