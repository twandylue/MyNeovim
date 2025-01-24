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

require("config.options")
require("config.autocmds")
require("config.keymaps")

if vim.g.vscode then
  -- VSCode Neovim
  local vs_plugins = require("vscode-plugins")
  require("lazy").setup(vs_plugins)
else
  require("config.cmds")
  local plugins = require("plugins")
  require("lazy").setup(plugins)
  require("plugin-config.lsp.init")
end
