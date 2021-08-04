syntax enable
set guicursor=
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set noerrorbells
set vb t_vb=
set number
set relativenumber
set cursorline
set hidden
set nowrap
"search options
set nohlsearch
set ignorecase
set incsearch
"history options
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set signcolumn=yes
set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'hail2u/vim-css3-syntax'
Plug 'lilydjwg/colorizer'

call plug#end()

colorscheme nord

let mapleader = " "
