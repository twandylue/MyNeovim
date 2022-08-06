return require('packer').startup(function()

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- gruvbox theme 
    use { 
        "ellisonleao/gruvbox.nvim", 
        requires = {"rktjmp/lush.nvim"} 
    }

    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- nvim-telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- nvim-gitsigns
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    -- nvim-lualine
    -- TODO 暫時不用 有議題未解決 搜索會被遮蔽 e.g. vim.wo.cursorline = true
    -- use {
    --   'nvim-lualine/lualine.nvim',
    --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    -- }

    -- nvim-feline
    use {
      'feline-nvim/feline.nvim', branch = '0.5-compat' 
    }

    -- nvim-hop
    use {
      'phaazon/hop.nvim',
      branch = 'v2',
      config = function()
        require('hop').setup()
      end
    }

    -- nvim-comment
    use {
        'numToStr/Comment.nvim',
        config = function()
          require('Comment').setup()
        end
    }

    -- nvim-autopairs
    use {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup {} 
        end
    }

    -- nvim-indent
    use {
      "lukas-reineke/indent-blankline.nvim"
    }

    -- nvim-surround
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- nvim-exchange
    use({
      "gbprod/substitute.nvim",
      config = function()
        require("substitute").setup({
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        })
      end
    })

    -- nvim-barbar
    -- use {
    --   'romgrk/barbar.nvim',
    --   requires = {'kyazdani42/nvim-web-devicons'}
    -- }

    -- nvim-bufferline
    use {
      'akinsho/bufferline.nvim', tag = "v2.*", 
      requires = 'kyazdani42/nvim-web-devicons'
    }

    -- nvim-scrollbar
    use({
      "petertriho/nvim-scrollbar",
      config = function()
        require("scrollbar").setup()
        -- require("scrollbar.handlers.search").setup()
      end
    })

    -- nvim-todo-comments
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
end)
