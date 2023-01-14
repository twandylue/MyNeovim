print("init.lua loaded")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require("plugins")
require("lazy").setup(plugins)

require("basic")
require("keybindings")
require("colorscheme")

-- plugins settings
-- require("plugin-config.nvim-tree")
require("plugin-config.nvim-oil")
require("plugin-config.nvim-gitsigns")
require("plugin-config.nvim-neogit")
-- require("plugin-config.nvim-feline")
require("plugin-config.nvim-lualine")
require("plugin-config.nvim-bufferline")
require("plugin-config.nvim-indent")
require("plugin-config.nvim-autopairs")
require("plugin-config.nvim-surround")
require("plugin-config.nvim-illuminate")
require("plugin-config.nvim-substitute")
require("plugin-config.nvim-colorizer")
require("plugin-config.nvim-hop")
require("plugin-config.nvim-transparent")
require("plugin-config.nvim-notify")
require("plugin-config.nvim-dashboard")
require("plugin-config.nvim-toggleterm")
require("plugin-config.nvim-smooth-cursor")
require("plugin-config.nvim-comment")
require("plugin-config.nvim-todo-comments")
require("plugin-config.nvim-telescope")
require("plugin-config.nvim-treesitter")
require("plugin-config.nvim-treesitter-context")
require("plugin-config.nvim-mason")
require("plugin-config.lsp.init")
require("plugin-config.nvim-lsp-inlay-hints")
require("plugin-config.lsp.lsp-signature")
require("plugin-config.nvim-lspsaga")
require("plugin-config.nvim-trouble")
require("plugin-config.nvim-cmp")
require("plugin-config.nvim-outline")
require("plugin-config.nvim-fidget")
require("plugin-config.nvim-zen-mode")
require("plugin-config.nvim-true-zen")
require("plugin-config.nvim-twilight")
require("plugin-config.nvim-neorg")
require("plugin-config.nvim-impatient")
require("plugin-config.nvim-aerial")
require("plugin-config.nvim-incline")
require("plugin-config.nvim-null-ls")
require("plugin-config.nvim-leap")
require("plugin-config.nvim-colorful-winsep")
require("plugin-config.nvim-glance")
require("plugin-config.nvim-rust-tool")
require("plugin-config.nvim-marks")
require("plugin-config.nvim-chatGPT")
require("plugin-config.nvim-rest")
