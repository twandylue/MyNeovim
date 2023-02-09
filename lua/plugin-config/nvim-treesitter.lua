local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("nvim-treesitter.configs is not installed", vim.log.levels.ERROR)
  print("nvim-treesitter.configs is not installed")
  return
end

if vim.fn.has("win32") == 1 then
  -- **warning** for specific lang of treesitter, specific compiler for c is required.
  -- recommend for win32: scoop install zig
  -- ref: https://github.com/nvim-treesitter/nvim-treesitter/issues/1985
  -- NOTE: Use the default compiler(gcc), if default compiler can't work, then use zig as the compiler for tree-sitter
  -- require("nvim-treesitter.install").compilers = { "zig" }
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
    "markdown_inline",
    "dockerfile",
    "regex",
    "javascript",
    "typescript",
    "css",
    "html",
    "http",
    "help",
    "norg",
    "norg_meta",
    "graphql",
    "gitcommit",
    "gitignore",
    "vim",
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  -- auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
    disable = { "help" },
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
})
