local status, stickyscrollerbar = pcall(require, "treesitter-context")
if not status then
  print("treesitter-context is not installed")
  return
end

stickyscrollerbar.setup({
  enable = true,
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = "outer",
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    -- For all filetypes
    -- Note that setting an entry here replaces all other patterns for this entry.
    -- By setting the 'default' entry below, you can control which nodes you want to
    -- appear in the context window.
    default = {
      "class",
      "function",
      "method",
      "for", -- These won't appear in the context
      "while",
      "if",
      "switch",
      "case",
    },
  },
  exact_patterns = {
    -- Example for a specific filetype with Lua patterns
    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
    -- exactly match "impl_item" only)
    -- rust = true,
  },

  zindex = 20, -- The Z-index of the context window
  mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
})
