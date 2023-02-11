local M = require("plugin-config.lsp.utils.utils")

local sumneko_lua = function(on_attach)
  M.nvim_lsp.sumneko_lua.setup({
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        hint = {
          enable = false,
        },
        format = {
          -- use null-ls to formatiing, not default formater in lua-lsp
          enable = false,
        },
        diagnostics = {
          -- get the language server to recognize the vim global
          globals = { "vim" },
        },
        workspace = {
          -- make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          -- ref: https://github.com/neovim/nvim-lspconfig/issues/1700
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
        telemetry = { enable = false },
      },
    },
  })
end

return sumneko_lua
