local M = require("plugin-config.lsp.utils.utils")

local rust = function(on_attach)
  M.nvim_lsp.rust_analyzer.setup({
    on_attach = on_attach,
    filetypes = { "rust" },
    -- cmd = { "rust-analyzer" },
    -- settings = { ["rust-analyzer"] = {} },
    root_dir = M.utils.root_pattern("Cargo.toml", "rust-project.json"),
  })
end

return rust
