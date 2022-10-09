local M = require("plugin-config.lsp.utils.utils")

local marksman = function(on_attach)
  M.nvim_lsp.marksman.setup({
    on_attach = on_attach,
    filetypes = { "markdown" },
    root_dir = M.utils.root_pattern(".git"),
    single_file_support = true,
  })
end
return marksman
