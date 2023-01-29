local status, lazy = pcall(require, "lazy")
if not status then
  print("lazy is not installed")
  return
end

local plugins = {
  "wbthomason/packer.nvim",
  -- colorscheme: gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  -- colorscheme: gruvbox-baby
  "luisiacc/gruvbox-baby",

  -- colorscheme: catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  -- colorscheme: tokyonight
  "folke/tokyonight.nvim",

  -- colorscheme: github
  "projekt0n/github-nvim-theme",

  -- colorscheme: kanagawa
  "rebelot/kanagawa.nvim",

  -- colorscheme: nightfox
  "EdenEast/nightfox.nvim",

  -- colorscheme: base16
  "RRethy/nvim-base16",

  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugin-config.nvim-tree")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    enabled = false,
  },

  -- vim-vinegar
  "tpope/vim-vinegar",

  -- oil-nvim
  {
    "stevearc/oil.nvim",
    config = function()
      require("plugin-config.nvim-oil")
    end,
  },

  -- nvim-telescope
  -- notice dependencies before installation (https://github.com/nvim-telescope/telescope.nvim#getting-started)
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.0",
    config = function()
      require("plugin-config.nvim-telescope")
    end,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
  },

  -- nvim-telescope extensions: file browser
  "nvim-telescope/telescope-file-browser.nvim",

  -- nvim-telescope extensions: project
  "nvim-telescope/telescope-project.nvim",

  -- nvim-telescope extensions: fzf
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- nvim-gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugin-config.nvim-gitsigns")
    end,
  },

  {
    "TimUntersberger/neogit",
    config = function()
      require("plugin-config.nvim-neogit")
    end,
    dependencies = "nvim-lua/plenary.nvim",
    enabled = false,
  },

  -- git-fugitive
  "tpope/vim-fugitive",

  -- git-diffview
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

  {
    "feline-nvim/feline.nvim",
    config = function()
      require("plugin-config.nvim-feline")
    end,
    enabled = false,
  },

  -- nvim-lualine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugin-config.nvim-lualine")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", opt = lazy },
  },

  -- lualine-lsp-progress
  "arkav/lualine-lsp-progress",

  -- vim-easymotion
  { "easymotion/vim-easymotion" },

  {
    "ggandor/leap.nvim",
    config = function()
      require("plugin-config.nvim-leap")
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugin-config.nvim-comment")
    end,
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("plugin-config.nvim-todo-comments")
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugin-config.nvim-autopairs")
    end,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("plugin-config.nvim-illuminate")
    end,
  },

  -- nvim-indent
  "lukas-reineke/indent-blankline.nvim",

  {
    "kylechui/nvim-surround",
    config = function()
      require("plugin-config.nvim-surround")
    end,
  },

  -- exchange text object ( NOTE: `cxc` to cancel)
  "gbprod/substitute.nvim",

  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    config = function()
      require("plugin-config.nvim-bufferline")
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugin-config.nvim-colorizer")
    end,
  },

  -- nvim-scrollview
  "dstein64/nvim-scrollview",

  -- nvim-markdown
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- markdow table
  "dhruvasagar/vim-table-mode",

  -- nvim-treesitter
  -- First time installation
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = function()
  --     require("nvim-treesitter.install").update({ with_sync = true })
  --   end,
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugin-config.nvim-treesitter")
    end,
  },

  -- treesitter playground
  "nvim-treesitter/playground",

  -- TODO:
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("plugin-config.nvim-treesitter-context")
    end,
  },

  -- rainbow parentheses works with treesitter
  "p00f/nvim-ts-rainbow",

  -- vim-autotag(work with treesitter)
  "windwp/nvim-ts-autotag",

  -- vim-visual-multi
  "mg979/vim-visual-multi",

  -- vim-easy-align
  "junegunn/vim-easy-align",

  -- expand region
  "terryma/vim-expand-region",

  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("plugin-config.nvim-dashboard")
    end,
    pin = true,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "folke/zen-mode.nvim",
    config = function()
      require("plugin-config.nvim-zen-mode")
    end,
  },

  -- true-zen (like zen-mode and goyo-vim)
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("plugin-config.nvim-true-zen")
    end,
  },

  -- twilight (like limelight)
  {
    "folke/twilight.nvim",
    config = function()
      require("plugin-config.nvim-twilight")
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugin-config.nvim-notify")
    end,
  },

  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("plugin-config.nvim-smooth-cursor")
    end,
  },

  {
    "chentoast/marks.nvim",
    config = function()
      require("plugin-config.nvim-marks")
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("plugin-config.nvim-toggleterm")
    end,
  },

  -- vscode-like pictograms
  "onsails/lspkind-nvim",

  -- nvim-cmp source for buffer words
  "hrsh7th/cmp-buffer",

  -- nvim-cmp source for neovim's built-in LSP
  -- "hrsh7th/cmp-nvim-lsp",

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugin-config.nvim-cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  -- Configurations for Nvim LSP
  "neovim/nvim-lspconfig",

  -- LSP UIs
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("plugin-config.nvim-lspsaga")
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("plugin-config.lsp.lsp-signature")
    end,
  },

  {
    "folke/trouble.nvim",
    config = function()
      require("plugin-config.nvim-trouble")
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  {
    "dnlhc/glance.nvim",
    config = function()
      require("plugin-config.nvim-glance")
    end,
  },

  {
    "simrat39/inlay-hints.nvim",
    config = function()
      require("plugin-config.nvim-lsp-inlay-hints")
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("plugin-config.nvim-rust-tool")
    end,
  },

  -- rust.vim
  "rust-lang/rust.vim",

  -- Debugging
  "nvim-lua/plenary.nvim",
  "mfussenegger/nvim-dap",

  -- Mason lsp server installer and manager
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason.lspconfig.nvim",
    config = function()
      require("plugin-config.nvim-mason")
    end,
  },

  -- Snippet TODO: studying...
  "L3MON4D3/LuaSnip",

  -- File icons
  "nvim-tree/nvim-web-devicons",

  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("plugin-config.nvim-transparent")
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("plugin-config.nvim-outline")
    end,
    enabled = false,
  },

  -- vim-exchange
  "tommcdo/vim-exchange",

  {
    "nvim-neorg/neorg",
    config = function()
      require("plugin-config.nvim-null-ls")
    end,
    -- important: export the CC(support for c++14, variable in general: export CC=/path/to/newer/compiler
    -- ref: https://github.com/nvim-neorg/neorg
    -- build = ":Neorg sync-parsers", -- This is the important bit!
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    "b0o/incline.nvim",
    config = function()
      require("plugin-config.nvim-incline")
    end,
  },

  -- WARN: conflict with lspsaga(outline)
  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("plugin-config.nvim-colorful-winsep")
    end,
    enabled = false,
  },

  -- neodev for lua in neovim
  "folke/neodev.nvim",

  -- cache of neovim modules
  {
    "lewis6991/impatient.nvim",
    config = function()
      require("plugin-config.nvim-impatient")
    end,
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require("plugin-config.nvim-aerial")
    end,
    enabled = false,
  },

  -- sqls command, coorperate with nvim_lsp.sqls in lspconfig
  "nanotee/sqls.nvim",

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("plugin-config.nvim-chatGPT")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- rest.nvim(http client)
  {
    "rest-nvim/rest.nvim",
    config = function()
      require("plugin-config.nvim-rest")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- vim sugar
  "tpope/vim-eunuch",
  "tpope/vim-unimpaired",
}

return plugins
