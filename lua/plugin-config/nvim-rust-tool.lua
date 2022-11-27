local lsp_init = require("plugin-config.lsp.init")
local status, rt = pcall(require, "rust-tools")
if not status then
  vim.notify("rust-tools is not installed", vim.log.levels.ERROR)
  print("symbols-outline is not installed")
  return
end

-- TODO: Working on Debugger...
-- -- Update this path
-- local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/"
-- print(extension_path)
-- local codelldb_path = extension_path .. "adapter/codelldb"
-- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
--
-- local opts = {
--   dap = {
--     adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
--   },
-- }
--
-- rt.setup(opts)

rt.setup({
  server = {
    on_attach = lsp_init.on_attach_rust_tool,
  },
})

local dap = require("dap")
dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
