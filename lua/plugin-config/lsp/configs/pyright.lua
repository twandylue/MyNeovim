local M = require("plugin-config.lsp.utils.utils")

local pyright = function(on_attach)
  M.nvim_lsp.pyright.setup({
    on_attach = on_attach,
    filetypes = { "python" },
    root_dir = M.utils.root_pattern(".git"),
    single_file_support = true,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        },
      },
    },
  })
end

return pyright
