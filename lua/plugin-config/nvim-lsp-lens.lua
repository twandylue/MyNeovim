local status, lsp_lens = pcall(require, "lsp-lens")
if not status then
  print("lsp-lens is not installed")
  return
end

lsp_lens.setup({
  enable = true,
  include_declaration = true,
  sections = {
    definition = false,
    references = true,
    implementation = true,
  },
})
