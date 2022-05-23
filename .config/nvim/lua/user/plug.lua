local fn = vim.fn
local install_path = fn.stdpath "data" .. "/plugged"

vim.call("plug#begin", install_path)

local Plug = vim.fn["plug#"]

Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug 'arcticicestudio/nord-vim'

vim.call("plug#end")
