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
  use 'nvim-telescope/telescope-file-browser.nvim'
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

  -- vim-autotag
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
  use 'lilydjwg/colorizer'

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
  --     'nvim-treesitter/nvim-treesitter',
  --     run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  -- }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-context' -- sticky header

  -- vim-visual-multi
  use 'mg979/vim-visual-multi'

  -- vim-easy-align
  use 'kg8m/vim-simple-align'

  -- nvim-dashboard
  use 'glepnir/dashboard-nvim'

  -- goyo-vim
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'

  -- nvim-notify
  use 'rcarriga/nvim-notify'

  -- smooth cursor
  use 'gen740/SmoothCursor.nvim'

  use { "akinsho/toggleterm.nvim", tag = 'v2.*' } -- nvim-toggleterm
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'xiyaowong/nvim-transparent' -- Transparent background
  use 'ray-x/lsp_signature.nvim' -- lsp signature
  use 'simrat39/symbols-outline.nvim' -- symbols-outline
  use 'j-hui/fidget.nvim' -- fidget
  use 'williamboman/mason.nvim' -- Mason lsp server installer
  use 'williamboman/mason.lspconfig.nvim'
end)
