local status, nightfox = pcall(require, "nightfox")
if not status then
  vim.notify("Color chemem: nightfox is not installed")
  print("Color chemem: nightfox is not installed")
  return
end

local options = {
  compile_path = vim.fn.stdpath("cache") .. "/nightfox",
  terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
  dim_inactive = false, -- Non focused panes set to alternative background
  styles = {
    comments = "NONE",
    conditionals = "NONE",
    constants = "NONE",
    functions = "italic",
    keywords = "bold",
    numbers = "NONE",
    operators = "NONE",
    strings = "NONE",
    types = "NONE",
    variables = "NONE",
  },
  -- TODO: How to enable modules...?
  modules = {
    telescope = true,
    hop = true,
  },
}

local groups = {
  all = {
    Search = { bg = "#9D0006", fg = "#FABD2F" },
    IncSearch = { bg = "#FF2D21", fg = "#000000" },
  },
}

-- TODO: still working...
nightfox.setup({ options = options, groups = groups })
