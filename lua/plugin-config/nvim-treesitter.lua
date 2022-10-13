local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("nvim-treesitter.configs is not installed", vim.log.levels.ERROR)
  print("nvim-treesitter.configs is not installed")
  return
end

ts.setup({
  ensure_installed = {
    "bash",
    "c_sharp",
    "python",
    "rust",
    "cpp",
    "lua",
    "sql",
    "toml",
    "json",
    "yaml",
    "markdown",
    "dockerfile",
    "regex",
    "javascript",
    "typescript",
    "html",
    "css",
    "help",
    -- "c",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
    -- make sure format in help documents correct
    disable = { "help" },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    ensure = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
})
