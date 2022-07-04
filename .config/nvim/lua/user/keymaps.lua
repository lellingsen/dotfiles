local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Hack - clear out netrw mapping for ctrl-l before mapping it again down below
keymap("n", "<leader><leader><leader><leader>l", "<Plug>NetrwRefresh", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)


-- Move text up and down - these are <A-k> and <A-j> but Mac sends specific keycodes for them
keymap("n", "˚", "<Esc>:m .-2<CR>==", opts)
keymap("n", "∆", "<Esc>:m .+1<CR>==", opts)

-- Visual mode - move text up and down
keymap("v", "∆", ":m .+1<CR>==", opts)
keymap("v", "˚", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- lsp keymaps are in the lsp file,
-- as they need to be done in the on_attach
