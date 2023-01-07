require("colorschemes.github-theme")
require("colorschemes.nightfox")
require("colorschemes.catppuccin")
require("colorschemes.gruvbox")
require("colorschemes.kanagawa")

-- setting color scheme

-- github
-- vim.api.nvim_command("colorscheme github_dark") -- github_dimmed, github_dark, github_dark_default, github_dark_colorblind

-- catppuccin
-- vim.api.nvim_command("colorscheme catppuccin")

-- kanagawa
-- vim.o.background = "dark"
-- vim.api.nvim_command("colorscheme kanagawa")

-- arctic (not support dashboard)
-- vim.api.nvim_command("colorscheme arctic")

-- nightfox
-- vim.api.nvim_command("colorscheme nightfox")
-- vim.g.lightline = { colorscheme = "nightfox" }
vim.api.nvim_command("colorscheme carbonfox")
vim.g.lightline = { colorscheme = "carbonfox" }

-- gruvbox
-- vim.o.background = "dark"
-- vim.api.nvim_command("colorscheme gruvbox")

-- vim.g.gruvbox_baby_background_color = "dark"
-- vim.api.nvim_command("colorscheme gruvbox-baby")
