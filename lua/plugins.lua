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
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  },

  -- vim-vinegar
  "tpope/vim-vinegar",

  -- oil-nvim
  "stevearc/oil.nvim",

  -- nvim-telescope
  -- notice dependencies before installation (https://github.com/nvim-telescope/telescope.nvim#getting-started)
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.0",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
  },

  -- nvim-telescope extensions: file browser
  "nvim-telescope/telescope-file-browser.nvim",

  -- nvim-telescope extensions: project
  "nvim-telescope/telescope-project.nvim",

  -- nvim-telescope extensions: fzf
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- nvim-gitsigns
  "lewis6991/gitsigns.nvim",

  { "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },

  -- git-fugitive
  "tpope/vim-fugitive",

  -- git-diffview
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

  -- nvim-feline
  "feline-nvim/feline.nvim",

  -- nvim-lualin
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = lazy },
  },

  -- vim-easymotion
  { "easymotion/vim-easymotion" },

  -- nvim-leap
  { "ggandor/leap.nvim" },

  -- nvim-comment
  "numToStr/Comment.nvim",

  -- nvim-todo-comments
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- nvim-autopairs
  "windwp/nvim-autopairs",

  -- vim-illuminate
  "RRethy/vim-illuminate",

  -- nvim-indent
  "lukas-reineke/indent-blankline.nvim",

  -- nvim-surround
  "kylechui/nvim-surround",

  -- exchange text object ( NOTE: `cxc` to cancel)
  "gbprod/substitute.nvim",

  -- nvim-bufferline
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- colorizer
  "norcalli/nvim-colorizer.lua",

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
  },

  -- treesitter playground
  "nvim-treesitter/playground",

  -- sticky header
  "nvim-treesitter/nvim-treesitter-context",

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

  -- nvim-dashboard
  "glepnir/dashboard-nvim",

  -- zen-mode
  "folke/zen-mode.nvim",

  -- true-zen (like zen-mode and goyo-vim)
  "Pocco81/true-zen.nvim",

  -- twilight (like limelight)
  "folke/twilight.nvim",

  -- nvim-notify
  "rcarriga/nvim-notify",

  -- smooth cursor
  "gen740/SmoothCursor.nvim",

  -- marks
  "chentoast/marks.nvim",

  -- nvim-toggleterm
  { "akinsho/toggleterm.nvim", version = "*" },

  -- vscode-like pictograms
  "onsails/lspkind-nvim",

  -- nvim-cmp source for buffer words
  "hrsh7th/cmp-buffer",

  -- nvim-cmp source for neovim's built-in LSP
  "hrsh7th/cmp-nvim-lsp",

  -- Completion
  "hrsh7th/nvim-cmp",

  -- Configurations for Nvim LSP
  "neovim/nvim-lspconfig",

  -- LSP UIs
  "glepnir/lspsaga.nvim",

  -- lsp signature
  "ray-x/lsp_signature.nvim",

  -- lsp trouble
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- lsp preview
  "dnlhc/glance.nvim",

  -- lsp inlay-hints
  "simrat39/inlay-hints.nvim",

  -- rust-tool
  "simrat39/rust-tools.nvim",

  -- rust.vim
  "rust-lang/rust.vim",

  -- Debugging
  "nvim-lua/plenary.nvim",
  "mfussenegger/nvim-dap",

  -- Mason lsp server installer and manager
  "williamboman/mason.nvim",
  "williamboman/mason.lspconfig.nvim",

  -- Snippet TODO: studying...
  "L3MON4D3/LuaSnip",

  -- File icons
  "nvim-tree/nvim-web-devicons",

  -- Transparent background
  "xiyaowong/nvim-transparent",

  -- symbols-outline
  "simrat39/symbols-outline.nvim",

  -- fidget
  "j-hui/fidget.nvim",

  -- vim-exchange
  "tommcdo/vim-exchange",

  -- neorg
  {
    "nvim-neorg/neorg",
    -- important: export the CC(support for c++14, variable in general: export CC=/path/to/newer/compiler
    -- ref: https://github.com/nvim-neorg/neorg
    -- build = ":Neorg sync-parsers", -- This is the important bit!
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- incline.nvim
  "b0o/incline.nvim",

  -- colorful winsep
  "nvim-zh/colorful-winsep.nvim",

  -- neodev for lua in neovim
  "folke/neodev.nvim",

  -- cache of neovim modules
  "lewis6991/impatient.nvim",

  -- aerial(structures,
  "stevearc/aerial.nvim",

  -- sqls command, coorperate with nvim_lsp.sqls in lspconfig
  "nanotee/sqls.nvim",

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- ChatGPT
  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- rest.nvim(http client,
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- vim sugar
  "tpope/vim-eunuch",
  "tpope/vim-unimpaired",
}

return plugins
