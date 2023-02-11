local M = require("plugin-config.lsp.utils.utils")

local sumneko_lua = function()
  M.nvim_lsp.sumneko_lua.setup({
    settings = {
      Lua = {
        hint = {
          enable = false,
        },
        diagnostics = {
          -- get the language server to recognize the vim global
          globals = { "vim" },
        },
        workspace = {
          -- make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  })
end

return sumneko_lua
