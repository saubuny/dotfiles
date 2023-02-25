-- Basic options for vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap leader key
vim.keymap.set('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Navigate buffers
vim.keymap.set('n', '<S-L>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-H>', ':bprevious<CR>', opts)

-- Indent in visual mode better
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Better pasting
vim.keymap.set('v', 'p', '"_dP', opts)

-- Move line in visual block mode
vim.keymap.set('x', 'J', ':move ">+1<CR>gv-gv', opts)
vim.keymap.set('x', 'K', ':move "<-2<CR>gv-gv', opts)

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, opts)
vim.keymap.set('n', '<leader>gf', telescope.git_files, opts)
vim.keymap.set('n', '<leader>fg', telescope.live_grep, opts)
vim.keymap.set('n', '<leader>fb', telescope.buffers, opts)
vim.keymap.set('n', '<leader>fh', telescope.help_tags, opts)

-- Nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
