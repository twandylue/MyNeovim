local statusUtil, util = pcall(require, "lspconfig.util")
if (not statusUtil) then
  print("Util is not found")
  return
end

local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then
  print("lspconfig is not installed")
  return
end

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

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  filetypes = { "rust" },
  -- cmd = { "rust-analyzer" },
}

nvim_lsp.bashls.setup {
  on_attach = on_attach,
  filetypes = { "sh" },
  -- cmd = { "bash-language-server", "start" },
}

nvim_lsp.yamlls.setup {
  on_attach = on_attach,
  filetypes = { "yaml", "yaml.docker-compose" },
  -- cmd = { "yaml-language-server", "--stdio" },
  settings = {
    redhat = {
      telemetry = {
        enabled = false
      }
    }
  }
}

nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  filetypes = { "json", "jsonc" },
  -- cmd = { "vscode-json-language-server", "--stdio" },
}

nvim_lsp.dockerls.setup {
  on_attach = on_attach,
  filetype = { "dockerfile" },
  -- cmd = { "docker-langserver", "--stdio" }
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
  -- cmd = { "typescript-language-server", "--stdio" },
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

nvim_lsp.csharp_ls.setup {
  on_attach = on_attach,
  filetypes = { "cs" },
  root_dir = util.root_pattern(".git", "*.sln"),
  -- cmd = { "csharp-ls" },
}
