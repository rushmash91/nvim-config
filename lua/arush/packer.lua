-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {'rose-pine/neovim', name="rose-pine"}
  require('rose-pine').setup({
      -- Choose the variant 'moon'
      variant = 'moon',
      -- Your other configuration options here
  })

  -- Harpoon
  use {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Other useful plugins
  use "mbbill/undotree"
  use "tpope/vim-fugitive"

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  -- LSP Zero and completions
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip' -- For snippet completions
    }
  }

end)

