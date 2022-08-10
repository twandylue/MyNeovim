local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

require 'lspconfig'.rust_analyzer.setup {
  on_attach = on_attach,

  filetypes = { "rust" },
  cmd = { "rust-analyzer" },
}

require 'lspconfig'.bashls.setup {
  on_attach = on_attach,
  filetypes = { "sh" },
  cmd = { "bash-language-server", "start" },
}

require 'lspconfig'.yamlls.setup {
  on_attach = on_attach,
  filetypes = { "yaml", "yaml.docker-compose" },
  cmd = { "yaml-language-server", "--stdio" },
  settings = {
    redhat = {
      telemetry = {
        enabled = false
      }
    }
  }
}

require 'lspconfig'.jsonls.setup {
  on_attach = on_attach,
  filetypes = { "json", "jsonc" },
  cmd = { "vscode-json-language-server", "--stdio" },
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- get the language server to recognize the vim global
        globals = { "vim" }
      },
      workspace = {
        -- make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}


-- M = {}
-- local status_ok, _ = pcall(require, "lspconfig")
-- if not status_ok then
--   return
-- end
--
-- M.server_capabilities = function()
--   local active_clients = vim.lsp.get_active_clients()
--   local active_client_map = {}
--
--   for index, value in ipairs(active_clients) do
--     active_client_map[value.name] = index
--   end
--
--   vim.ui.select(vim.tbl_keys(active_client_map), {
--     prompt = "Select client:",
--     format_item = function(item)
--       return "capabilites for: " .. item
--     end,
--   }, function(choice)
--     -- print(active_client_map[choice])
--     print(vim.inspect(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities.executeCommandProvider))
--     vim.pretty_print(vim.lsp.get_active_clients()[active_client_map[choice]].server_capabilities)
--   end)
-- end
--
-- require "plugin-config.lsp.lsp-signature"
-- -- require "plugin-config.lsp.lsp-installer"
-- require("plugin-config.lsp.mason")
-- require("plugin-config.lsp.handlers").setup()
-- -- require "user.lsp.null-ls"
--
-- local l_status_ok, lsp_lines = pcall(require, "lsp_lines")
-- if not l_status_ok then
--   return
-- end
--
-- lsp_lines.setup()
--
-- return M
