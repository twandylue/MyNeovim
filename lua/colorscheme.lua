require("colorschemes.github-theme")
require("colorschemes.nightfox")
require("colorschemes.catppuccin")
require("colorschemes.gruvbox")
require("colorschemes.kanagawa")
require("colorschemes.tokyonight")
require("colorschemes.nord")

-- setting color scheme

-- github
vim.api.nvim_command("colorscheme github_dark_default") -- github_dimmed, github_dark, github_dark_default, github_dark_colorblind

-- catppuccin
-- option: latte, frappe, macchiato, mocha
-- vim.g.catppuccin_flavour = "mocha"
-- vim.api.nvim_command("colorscheme catppuccin")

-- kanagawa
-- vim.o.background = "dark"
-- vim.api.nvim_command("colorscheme kanagawa")

-- arctic (not support dashboard)
-- vim.api.nvim_command("colorscheme arctic")

-- nightfox
-- vim.api.nvim_command("colorscheme nightfox")
-- vim.g.lightline = { colorscheme = "nightfox" }

-- tokyo
-- option: tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
-- vim.api.nvim_command("colorscheme tokyonight-night")

-- nord
-- vim.api.nvim_command("colorscheme nord")

-- gruvbox
-- vim.o.background = "dark"
-- vim.api.nvim_command("colorscheme gruvbox")
