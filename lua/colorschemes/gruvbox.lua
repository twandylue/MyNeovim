local status_gruvbox, gruvbox = pcall(require, "gruvbox")
if not status_gruvbox then
  vim.notify("Color chemem: gruvbox is not installed")
  print("Color chemem: gruvbox is not installed")
  return
end

gruvbox.setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
