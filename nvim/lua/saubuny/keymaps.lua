-- Basic options for keymaps
local opts = { noremap = true, silent = true };

-- Shorten name
-- (mode, new keymap, command, options)
local keymap = vim.api.nvim_set_keymap; 

-- Remap leader key
keymap("", "<Space>", "<Nop>", opts);
vim.g.mapleader = " ";
vim.g.maplocalleader = " ";

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts);
keymap("n", "<C-j>", "<C-w>j", opts);
keymap("n", "<C-k>", "<C-w>k", opts);
keymap("n", "<C-l>", "<C-w>l", opts);

-- Open Netrw
keymap("n", "<leader>e", ":Lex 40<CR>", opts);

-- Navigate buffers
keymap("n", "<S-L>", ":bnext<CR>", opts);
keymap("n", "<S-H>", ":bprevious<CR>", opts);

-- Indent in visual mode better
keymap("v", "<", "<gv", opts);
keymap("v", ">", ">gv", opts);

-- Better pasting
keymap("v", "p", '"_dP', opts);

-- Move line in visual block mode
keymap("x", "J", ":move '>+1<CR>gv-gv", opts);
keymap("x", "K", ":move '<-2<CR>gv-gv", opts);

