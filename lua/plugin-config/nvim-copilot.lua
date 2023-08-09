vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = false,
  ["rust"] = true,
  ["c"] = true,
  ["c#"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = true,
}

-- vim.api.nvim_command([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
vim.g.copilot_assume_mapped = true
