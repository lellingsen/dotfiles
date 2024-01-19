local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
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
-- use system clipboard
opt.clipboard = "unnamedplus"
-- whitespace characters
opt.list = true
opt.listchars:append({tab = "▸ "})
opt.listchars:append({space = "·"})
opt.listchars:append({eol = ""})
