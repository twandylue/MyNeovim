local M = require("plugin-config.lsp.utils.utils")

local latex_ls = function(on_attach)
  M.nvim_lsp.texlab.setup({
    on_attach = on_attach,
    filetypes = { "tex", "plaintex", "bib" },
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = false,
          onSave = false,
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = false,
        },
        diagnosticsDelay = 300,
        formatterLineLength = 80,
        forwardSearch = {
          args = {},
        },
        latexFormatter = "latexindent",
        latexindent = {
          modifyLineBreaks = false,
        },
      },
    },
    single_file_support = true,
  })
end

return latex_ls
