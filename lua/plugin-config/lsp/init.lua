local statusUtil, util = pcall(require, "lspconfig.util")
if (not statusUtil) then
  print("Util is not found")
  return
end

local status_lspconfig, nvim_lsp = pcall(require, 'lspconfig')
if (not status_lspconfig) then
  print("lspconfig is not installed")
  return
end


local status_lua_dev, lua_dev = pcall(require, 'lua-dev')
if (not status_lua_dev) then
  print("lua-dev is not installed")
  return
end

-- local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end

nvim_lsp.vimls.setup {
  on_attach = require("aerial").on_attach,
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  filetypes = { "rust" },
  -- cmd = { "rust-analyzer" },
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
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  init_options = { hostInfo = "neovim" },
  -- cmd = { "typescript-language-server", "--stdio" },
}

-- IMPORTANT: make sure to setup lua-dev BEFORE lspconfig
lua_dev.setup({})

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
      },
      completion = {
        callSnippet = "Replace"
      }
    }
  }
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  root_dir = util.root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),
  single_file_support = true
}

nvim_lsp.bashls.setup {
  on_attach = on_attach,
  cmd_env = { GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)" },
  filetypes = { "sh" },
  root_dir = util.find_git_ancestor,
  single_file_support = true,
}

nvim_lsp.cmake.setup {
  on_attach = on_attach,
  filetypes = { "cmake" },
  init_options = {
    buildDirectory = "build"
  },
  root_dir = util.root_pattern('CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake'),
  single_file_support = true,
}

nvim_lsp.csharp_ls.setup {
  on_attach = on_attach,
  filetypes = { "cs" },
  root_dir = util.root_pattern(".git", "*.sln"),
  -- root_dir = util.root_pattern(".git", "*.sln", "*csproj"),
  -- cmd = { "csharp-ls" },
}

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  filetypes = { "python" },
  root_dir = util.root_pattern(".git"),
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true
      }
    }
  }
}

nvim_lsp.sqls.setup {
  on_attach = function(client, bufnr)
    -- builtin vim.lsp.buf.format() of "sqls" is terriable, not works very well
    require('sqls').on_attach(client, bufnr)
  end,
  filetype = { "sql", "mysql" },
  single_file_support = true,
  settings = {
    sqls = {
      -- for demo
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=localhost port=5432 user=postgres password=medusa dbname=portal_shell sslmode=disable',
        },
      },
    },
  },
}
