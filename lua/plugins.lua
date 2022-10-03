local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- gruvbox theme
  use {
    "ellisonleao/gruvbox.nvim",
    requires = { "rktjmp/lush.nvim" }
  }

  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- nvim-telescope
  -- notice dependencies before installation (https://github.com/nvim-telescope/telescope.nvim#getting-started)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- nvim-telescope extensions: file browser
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- nvim-telescope extensions: project
  use 'nvim-telescope/telescope-project.nvim'

  -- nvim-telescope extensions: fzf
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- nvim-gitsigns
  use 'lewis6991/gitsigns.nvim'

  -- nvim-neogit
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- git-fugitive
  use 'tpope/vim-fugitive'

  -- git-diffview
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- git-blame
  use 'f-person/git-blame.nvim'

  -- nvim-feline
  use { 'feline-nvim/feline.nvim', branch = '0.5-compat' }

  -- nvim-hop
  use { 'phaazon/hop.nvim', branch = 'v2', }

  -- nvim-comment
  use 'numToStr/Comment.nvim'

  -- nvim-autopairs
  use "windwp/nvim-autopairs"

  -- vim-autotag TODO:
  use 'windwp/nvim-ts-autotag'

  -- vim-illuminate
  use 'RRethy/vim-illuminate'

  -- nvim-indent
  use "lukas-reineke/indent-blankline.nvim"

  -- nvim-surround
  use "kylechui/nvim-surround"

  -- nvim-exchange
  use "gbprod/substitute.nvim"

  -- nvim-bufferline
  use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- colorizer
  use 'norcalli/nvim-colorizer.lua'

  -- nvim-scrollview
  use 'dstein64/nvim-scrollview'

  -- nvim-todo-comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- nvim-markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  -- nvim-treesitter
  -- First time installation
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  -- }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- sticky header
  use 'nvim-treesitter/nvim-treesitter-context'

  -- vim-visual-multi
  use 'mg979/vim-visual-multi'

  -- vim-easy-align
  use 'kg8m/vim-simple-align'

  -- nvim-dashboard
  use 'glepnir/dashboard-nvim'

  -- goyo-vim
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- zen-mode
  use "folke/zen-mode.nvim"

  -- true-zen (like zen-mode and goyo-vim)
  use 'Pocco81/true-zen.nvim'

  -- twilight (like limelight)
  use "folke/twilight.nvim"

  -- nvim-notify
  use 'rcarriga/nvim-notify'

  -- smooth cursor
  use 'gen740/SmoothCursor.nvim'

  -- nvim-toggleterm
  use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

  -- vscode-like pictograms
  use 'onsails/lspkind-nvim'

  -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-buffer'

  -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-nvim-lsp'

  -- Completion
  use 'hrsh7th/nvim-cmp'

  -- Configurations for Nvim LSP
  use 'neovim/nvim-lspconfig'

  -- LSP UIs-- LSP UIs
  use 'glepnir/lspsaga.nvim'

  -- lsp signature
  use 'ray-x/lsp_signature.nvim'

  -- lsp trouble
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }

  -- Mason lsp server installer and manager
  use 'williamboman/mason.nvim'
  use 'williamboman/mason.lspconfig.nvim'

  -- Snippet TODO: studying...
  use 'L3MON4D3/LuaSnip'

  -- File icons
  use 'kyazdani42/nvim-web-devicons'

  -- Transparent background
  use 'xiyaowong/nvim-transparent'

  -- symbols-outline
  use 'simrat39/symbols-outline.nvim'

  -- fidget
  use 'j-hui/fidget.nvim'

  -- scrollbar
  -- use 'petertriho/nvim-scrollbar'

  -- vim-exchange
  use 'tommcdo/vim-exchange'

  -- neorg
  use {
    "nvim-neorg/neorg",
    -- important: export the CC(support for c++14) variable in general: export CC=/path/to/newer/compiler
    -- ref: https://github.com/nvim-neorg/neorg
    run = ":Neorg sync-parsers", -- This is the important bit!
    ft = "norg",
    requires = "nvim-lua/plenary.nvim"
  }

  -- incline.nvim
  use "b0o/incline.nvim"

  -- dev for lua in neovim
  use "folke/lua-dev.nvim"

  -- cache of neovim modules
  use 'lewis6991/impatient.nvim'

  -- aerial(function list)
  use 'stevearc/aerial.nvim'
end)
