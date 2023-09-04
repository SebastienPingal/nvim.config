-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "folke/tokyonight.nvim"
  use "rebelot/kanagawa.nvim"
  use "rakr/vim-one"
  use 'ayu-theme/ayu-vim'
  use 'morhetz/gruvbox'
  use 'tomasr/molokai'
  use 'catppuccin/nvim'
  use 'nanotech/jellybeans.vim'
  use 'junegunn/seoul256.vim'
  use 'sainnhe/sonokai'
  use 'sainnhe/edge'
  use 'sainnhe/everforest'
  use 'mofiqul/vscode.nvim'
  use 'bluz71/vim-moonfly-colors'
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
      vim.cmd('set background=dark')
    end
  })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'github/copilot.vim'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use 'ryanoasis/vim-devicons'
  use {
    's1n7ax/nvim-window-picker',
    tag = 'v2.*',
    config = function()
      require 'window-picker'.setup()
    end,
  }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }
end)
