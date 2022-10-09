local M = require("plugin-config.lsp.utils.utils")

local cmake = function(on_attach)
  M.nvim_lsp.cmake.setup({
    on_attach = on_attach,
    filetypes = { "cmake" },
    init_options = {
      buildDirectory = "build",
    },
    root_dir = M.utils.root_pattern("CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake"),
    single_file_support = true,
  })
end

return cmake
