-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- color schemes
  use "rebelot/kanagawa.nvim"
  use "phha/zenburn.nvim"
  use "yazeed1s/minimal.nvim"

  -- all in this block is LSP/autocompletion related
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'kyazdani42/nvim-web-devicons'; -- Icons, dependency of several othter plugins

  -- syntax highlighting
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })

  -- status bar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- fuzzy finder
  --dependencies:
  --  - yay -S ripgrep (AUR)
  --  - yay -S fd (community)
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- telescope plugin to provide worktree support with bare repos
  use 'ThePrimeagen/git-worktree.nvim'

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- autoformat code
  -- npm i -g prettier prettier-svelte-plugin
  use 'sbdchd/neoformat'

  -- comment out multiple lines at once
  use 'tpope/vim-commentary'

  -- automatically close (, {, ", ', etc
  use {
	'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup {} end
  }

  use 'windwp/nvim-ts-autotag'

end)
