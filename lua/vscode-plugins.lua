local plugins = {

  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugin-config.nvim-autopairs")
    end,
  },

  {
    "kylechui/nvim-surround",
    config = function()
      require("plugin-config.nvim-surround")
    end,
  },

  -- -- nvim-treesitter
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   config = function()
  --     require("plugin-config.nvim-treesitter")
  --   end,
  -- },
  --
  -- "nvim-treesitter/playground",
  -- "nvim-lua/plenary.nvim",
  -- vim sugar
  -- "tpope/vim-fugitive",
  "tpope/vim-eunuch",
  "tpope/vim-unimpaired",
  "tommcdo/vim-exchange",
  -- -- Comment in header file in c++
  -- "vim-scripts/DoxygenToolkit.vim",
  -- -- Open big files
  -- "LunarVim/bigfile.nvim",
}

return plugins
