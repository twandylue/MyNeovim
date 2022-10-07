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

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
catppuccin.setup()

-- set color scheme
vim.api.nvim_command("colorscheme catppuccin")
-- vim.api.nvim_command("colorscheme gruvbox")
