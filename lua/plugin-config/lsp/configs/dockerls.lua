local M = require("plugin-config.lsp.utils.utils")

local dockerls = function(on_attach)
  M.nvim_lsp.dockerls.setup({
    on_attach = on_attach,
    filetype = { "dockerfile" },
    -- cmd = { "docker-langserver", "--stdio" }
  })
end
return dockerls
