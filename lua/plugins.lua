local status, packer = pcall(require, "packer")
if not status then
  print("Packer is not installed")
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup({
  config = {
    max_jobs = 10,
  },
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- colorscheme: gruvbox
    use({
      "ellisonleao/gruvbox.nvim",
      requires = { "rktjmp/lush.nvim" },
    })

    -- colorscheme: gruvbox-baby
    use({
      "luisiacc/gruvbox-baby",
    })

    -- colorscheme: catppuccin
    use({
      "catppuccin/nvim",
      as = "catppuccin",
    })

    -- colorscheme: github
    use("projekt0n/github-nvim-theme")

    -- colorscheme: kanagawa
    use("rebelot/kanagawa.nvim")

    -- colorscheme: arctic
    use({ "rockyzhang24/arctic.nvim", requires = { "rktjmp/lush.nvim" } })

    -- colorscheme: nightfox
    use("EdenEast/nightfox.nvim")

    -- colorscheme: tokyonight
    use("folke/tokyonight.nvim")

    -- colorscheme: nord
    use("shaunsingh/nord.nvim")

    -- colorscheme: base16
    use("RRethy/nvim-base16")

    -- nvim-tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
    })

    -- nvim-telescope
    -- notice dependencies before installation (https://github.com/nvim-telescope/telescope.nvim#getting-started)
    use({
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      requires = { "nvim-lua/plenary.nvim" },
    })

    -- nvim-telescope extensions: file browser
    use("nvim-telescope/telescope-file-browser.nvim")

    -- nvim-telescope extensions: project
    use("nvim-telescope/telescope-project.nvim")

    -- nvim-telescope extensions: fzf
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- nvim-gitsigns
    use("lewis6991/gitsigns.nvim")

    -- nvim-neogit
    if vim.fn.has("win32") == 1 then
      -- WARNING: In win, neovim can not functionally commit message after neogit/Commit(9c63259c56e13e3385705fd44722f31381045c0c) at 2022/9/12, so I decide to use the old version of neogit by specifying commit
      use({
        "TimUntersberger/neogit",
        commit = "536ded80c32caf58c50c62ed4670b61d6a462d8e",
        requires = "nvim-lua/plenary.nvim",
      })
    else
      use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
    end

    -- git-fugitive
    use("tpope/vim-fugitive")

    -- git-diffview
    use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

    -- git-blame
    use("f-person/git-blame.nvim")

    -- nvim-feline
    use("feline-nvim/feline.nvim")

    -- nvim-hop
    use({ "phaazon/hop.nvim", branch = "v2" })

    -- nvim-leap
    use({ "ggandor/leap.nvim" })

    -- nvim-comment
    use("numToStr/Comment.nvim")

    -- nvim-todo-comments
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
    })

    -- nvim-autopairs
    use("windwp/nvim-autopairs")

    -- vim-illuminate
    use("RRethy/vim-illuminate")

    -- nvim-indent
    use("lukas-reineke/indent-blankline.nvim")

    -- nvim-surround
    use("kylechui/nvim-surround")

    -- exchange text object ( NOTE: cxc to cancel)
    use("gbprod/substitute.nvim")

    -- nvim-bufferline
    use({
      "akinsho/bufferline.nvim",
      tag = "v3.*",
      requires = "kyazdani42/nvim-web-devicons",
    })

    -- colorizer
    use("norcalli/nvim-colorizer.lua")

    -- nvim-scrollview
    use("dstein64/nvim-scrollview")

    -- nvim-markdown
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    })

    -- markdow table
    use("dhruvasagar/vim-table-mode")

    -- nvim-treesitter
    -- First time installation
    -- use {
    --   'nvim-treesitter/nvim-treesitter',
    --   run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    -- }
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })

    -- treesitter playground
    use("nvim-treesitter/playground")

    -- sticky header
    use("nvim-treesitter/nvim-treesitter-context")

    -- rainbow parentheses works with treesitter
    use("p00f/nvim-ts-rainbow")

    -- vim-autotag(work with treesitter)
    use("windwp/nvim-ts-autotag")

    -- vim-visual-multi
    use("mg979/vim-visual-multi")

    -- vim-easy-align
    use("junegunn/vim-easy-align")

    -- expand region
    use({ "terryma/vim-expand-region" })

    -- nvim-dashboard
    use("glepnir/dashboard-nvim")

    -- goyo-vim
    -- use("junegunn/goyo.vim")
    -- use("junegunn/limelight.vim")

    -- zen-mode
    use("folke/zen-mode.nvim")

    -- true-zen (like zen-mode and goyo-vim)
    use("Pocco81/true-zen.nvim")

    -- twilight (like limelight)
    use("folke/twilight.nvim")

    -- nvim-notify
    use("rcarriga/nvim-notify")

    -- smooth cursor
    use("gen740/SmoothCursor.nvim")

    -- marks
    use({ "chentoast/marks.nvim" })

    -- nvim-toggleterm
    use({ "akinsho/toggleterm.nvim", tag = "*" })

    -- vscode-like pictograms
    use("onsails/lspkind-nvim")

    -- nvim-cmp source for buffer words
    use("hrsh7th/cmp-buffer")

    -- nvim-cmp source for neovim's built-in LSP
    use("hrsh7th/cmp-nvim-lsp")

    -- Completion
    use("hrsh7th/nvim-cmp")

    -- Configurations for Nvim LSP
    use("neovim/nvim-lspconfig")

    -- LSP UIs-- LSP UIs
    use("glepnir/lspsaga.nvim")

    -- lsp signature
    use("ray-x/lsp_signature.nvim")

    -- lsp trouble
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    })

    -- lsp preview
    use("dnlhc/glance.nvim")

    -- lsp inlay-hints
    use("simrat39/inlay-hints.nvim")

    -- rust-tool
    use("simrat39/rust-tools.nvim")

    -- rust.vim
    use("rust-lang/rust.vim")

    -- Debugging
    use("nvim-lua/plenary.nvim")
    use("mfussenegger/nvim-dap")

    -- Mason lsp server installer and manager
    use("williamboman/mason.nvim")
    use("williamboman/mason.lspconfig.nvim")

    -- Snippet TODO: studying...
    use("L3MON4D3/LuaSnip")

    -- File icons
    use("kyazdani42/nvim-web-devicons")

    -- Transparent background
    use("xiyaowong/nvim-transparent")

    -- symbols-outline
    use("simrat39/symbols-outline.nvim")

    -- fidget
    use("j-hui/fidget.nvim")

    -- vim-exchange
    use("tommcdo/vim-exchange")

    -- neorg
    use({
      "nvim-neorg/neorg",
      -- important: export the CC(support for c++14) variable in general: export CC=/path/to/newer/compiler
      -- ref: https://github.com/nvim-neorg/neorg
      -- run = ":Neorg sync-parsers", -- This is the important bit!
      requires = "nvim-lua/plenary.nvim",
    })

    -- incline.nvim
    use("b0o/incline.nvim")

    -- colorful winsep
    use("nvim-zh/colorful-winsep.nvim")

    -- neodev for lua in neovim
    use("folke/neodev.nvim")

    -- cache of neovim modules
    use("lewis6991/impatient.nvim")

    -- aerial(structures)
    use("stevearc/aerial.nvim")

    -- sqls command, coorperate with nvim_lsp.sqls in lspconfig
    use("nanotee/sqls.nvim")

    -- null-ls
    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })

    -- ChatGPT
    use({
      "jackMort/ChatGPT.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
      },
    })

    -- rest.nvim(http client)
    use({
      "rest-nvim/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
    })

    -- ssr
    -- use({ "cshuaimin/ssr.nvim", module = "ssr" })

    -- noise
    -- WARNING: waiting for being more mature
    -- use({
    --   event = "VimEnter",
    --   "folke/noice.nvim",
    --   config = function()
    --     require("noice").setup()
    --   end,
    --   requires = {
    --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --     "MunifTanjim/nui.nvim",
    --     "rcarriga/nvim-notify",
    --   },
    -- })
  end,
})
