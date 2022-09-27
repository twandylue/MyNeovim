local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print("nvim-treesitter.configs is not installed")
  return
end

ts.setup {
  ensure_installed = {
    "bash",
    "c_sharp",
    "sql",
    "lua",
    "json",
    "yaml",
    "markdown",
    "dockerfile",
    "regex",
    "javascript",
    "html",
    "css",
    -- "c",
    "rust",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {}
  },
  autotag = {
    ensure = true,
  }
}
