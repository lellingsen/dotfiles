local fn = vim.fn

-- install packer automatically
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing Packer, close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- install plugins whenever this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- test to see if Packer is installed before using it
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
  -- core packages
  use "wbthomason/packer.nvim" -- Packer can manage itself
  use "nvim-lua/plenary.nvim" -- shared NVIM functions
  use "nvim-lua/popup.nvim" -- required for some other plugins
  -- LSP, treesitter, DAP, Mason
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use { "jose-elias-alvarez/null-ls.nvim" }
  use "mfussenegger/nvim-dap"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  -- Completion
  use "hrsh7th/nvim-cmp" -- core comp plugin
  use "hrsh7th/cmp-nvim-lsp" -- to integrate with native LSP
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lua"
  use "dcampos/nvim-snippy"
  use "dcampos/cmp-snippy"
  -- color themes
  use 'shaunsingh/nord.nvim' -- nvim specific nord implementation
  use 'rmehri01/onenord.nvim' -- combination of onedark and nord
  use "folke/tokyonight.nvim"
  use "ellisonleao/gruvbox.nvim"
  use 'marko-cerovac/material.nvim'
  use 'sainnhe/everforest'
  -- git
  use "tpope/vim-fugitive"
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }
  -- lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- telescope
  use "nvim-telescope/telescope.nvim"
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- helpful utils
  use {"ellisonleao/glow.nvim", branch = "main"}
  use "gpanders/editorconfig.nvim"
  use {
    "numToStr/Comment.nvim",
    config = function ()
      require('Comment').setup()
    end
  }

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
