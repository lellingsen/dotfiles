syntax enable
set guicursor=
set tabstop=2 softtabstop=2
set shiftwidth=2
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
set ignorecase
set incsearch
set hlsearch
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'hail2u/vim-css3-syntax'
Plug 'lilydjwg/colorizer'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

colorscheme nord

let mapleader = " "

"space-o to fuzzy find git file to open
nnoremap <silent> <leader>o :GFiles<CR>

"tab completion for COC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"COC GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"COC Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"Prettier + COC
command! -nargs=0 Prettier :CocCommand prettier.formatFile
