local M = require("plugin-config.lsp.utils.utils")

local tsserver = function(on_attach)
  M.nvim_lsp.tsserver.setup({
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = M.utils.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    init_options = { hostInfo = "neovim" },
    -- cmd = { "typescript-language-server", "--stdio" },
  })
end

return tsserver
