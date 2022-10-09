local M = require("plugin-config.lsp.utils.utils")

local sqls = function(on_attach)
  M.nvim_lsp.sqls.setup({
    on_attach = function(client, bufnr)
      -- builtin vim.lsp.buf.format() of "sqls" is terriable, not works very well
      require("sqls").on_attach(client, bufnr)
    end,
    filetype = { "sql", "mysql" },
    single_file_support = true,
    settings = {
      sqls = {
        -- for demo
        connections = {
          {
            driver = "postgresql",
            dataSourceName = "host=localhost port=5432 user=postgres password=medusa dbname=portal_shell sslmode=disable",
          },
        },
      },
    },
  })
end

return sqls
