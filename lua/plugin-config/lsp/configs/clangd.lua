local M = require("plugin-config.lsp.utils.utils")

local clangd = function(on_attach)
  M.nvim_lsp.clangd.setup({
    on_attach = on_attach,
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_dir = M.utils.root_pattern(
      ".clangd",
      ".clang-tidy",
      ".clang-format",
      "compile_commands.json",
      "compile_flags.txt",
      "configure.ac",
      ".git"
    ),
    single_file_support = true,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  })
end

return clangd
