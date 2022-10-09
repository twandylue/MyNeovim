local M = require("plugin-config.lsp.utils.utils")

local csharp_ls = function(on_attach)
  M.nvim_lsp.csharp_ls.setup({
    on_attach = on_attach,
    filetypes = { "cs" },
    root_dir = M.utils.root_pattern(".git", "*.sln"),
    -- root_dir = util.root_pattern(".git", "*.sln", "*csproj"),
    -- cmd = { "csharp-ls" },
  })
end

return csharp_ls
