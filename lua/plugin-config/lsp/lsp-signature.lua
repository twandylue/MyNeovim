local status_ok, lsp_signature = pcall(require, "lsp_signature")
if not status_ok then
  vim.notify("lsp_signature is not installed", vim.log.levels.ERROR)
  print("lsp_signature is not installed")
  return
end

lsp_signature.setup({
  bind = true,
  handler_opts = { border = "rounded" },
  hint_prefix = " ",
  -- hi_parameter = "IncSearch",
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
})
