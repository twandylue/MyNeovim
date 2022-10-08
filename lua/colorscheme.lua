local status_gruvbox, gruvbox = pcall(require, "gruvbox")
if not status_gruvbox then
  vim.notify("Color chemem: gruvbox is not installed")
  print("Color chemem: Gruvbox is not installed")
end

local status_catppuccin, catppuccin = pcall(require, "catppuccin")
if not status_catppuccin then
  vim.notify("Color chemem: catppuccin is not installed")
  print("Color chemem: catppuccin is not installed")
end

local status_github, github = pcall(require, "github-theme")
if not status_github then
  vim.notify("Color chemem: github-theme is not installed")
  print("Color chemem: github-theme is not installed")
end

local status_kanagawa, kanagawa = pcall(require, "kanagawa")
if not status_kanagawa then
  vim.notify("Color chemem: kanagawa is not installed")
  print("Color chemem: kanagawa is not installed")
end

catppuccin.setup()
github.setup({
  comment_style = "NONE",
  keyword_style = "NONE",
  -- function_style = "italic",
  function_style = "NONE",
  variable_style = "NONE",
})
kanagawa.setup()

-- setting color scheme

-- github
-- vim.api.nvim_command("colorscheme github_dark_default") -- github_dimmed, github_dark, github_dark_default, github_dark_colorblind

-- catppuccin
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- vim.api.nvim_command("colorscheme catppuccin")

-- kanagawa
-- vim.o.background = "dark"
-- vim.api.nvim_command("colorscheme kanagawa")

-- arctic (not support dashboard)
-- vim.api.nvim_command("colorscheme arctic")

-- nightfox (not support dashboard)
vim.api.nvim_command("colorscheme nightfox")
vim.g.lightline = { colorscheme = "nightfox" }

-- gruvbox
-- vim.o.background = "dark"
-- vim.api.nvim_command("colorscheme gruvbox")
