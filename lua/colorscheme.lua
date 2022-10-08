require("colorschemes.github-theme")
require("colorschemes.nightfox")
require("colorschemes.catppuccin")
require("colorschemes.gruvbox")
require("colorschemes.kanagawa")

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
