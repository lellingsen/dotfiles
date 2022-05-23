local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.hidden = true
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true
opt.signcolumn = "yes"
opt.mouse = "a"
opt.wildignore:append {"*/node_modules/*"}
opt.conceallevel = 0
opt.cmdheight = 2
-- history options
opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. '/undo'
opt.swapfile = false
opt.backup = false
-- search options
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

opt.clipboard = "unnamedplus"
