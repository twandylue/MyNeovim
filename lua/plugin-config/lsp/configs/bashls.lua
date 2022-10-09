local M = require("plugin-config.lsp.utils.utils")

local bashls = function(on_attach)
  M.nvim_lsp.bashls.setup({
    on_attach = on_attach,
    cmd_env = { GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)" },
    filetypes = { "sh" },
    root_dir = M.utils.find_git_ancestor,
    single_file_support = true,
  })
end

return bashls
