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

require 'lspconfig'.csharp_ls.setup {
  on_attach = on_attach,
  filetypes = { "cs" },
  cmd = { "csharp-ls" },
}
