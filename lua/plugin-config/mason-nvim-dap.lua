local status, mason_dap = pcall(require, "mason-nvim-dap")

if not status then
  print("mason-nvim-dap is not installed")
  return
end

mason_dap.setup({
  ensure_installed = { "codelldb" },
  handlers = {}, -- sets up dap in the predefined manner
})
