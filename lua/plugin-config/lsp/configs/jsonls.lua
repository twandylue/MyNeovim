local M = require("plugin-config.lsp.utils.utils")

local jsonls = function(on_attach)
  M.nvim_lsp.jsonls.setup({
    on_attach = on_attach,
    filetypes = { "json", "jsonc" },
    -- cmd = { "vscode-json-language-server", "--stdio" },
  })
end

return jsonls
