local M = require("plugin-config.lsp.utils.utils")

local yamlls = function(on_attach)
  M.nvim_lsp.yamlls.setup({
    on_attach = on_attach,
    filetypes = { "yaml", "yaml.docker-compose" },
    -- cmd = { "yaml-language-server", "--stdio" },
    settings = {
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
    },
  })
end

return yamlls
