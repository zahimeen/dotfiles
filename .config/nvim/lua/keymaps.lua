vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bd', ':BufferDelete<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>wh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wl', '<C-w>l', { noremap = true, silent = true })
 
vim.api.nvim_set_keymap('n', '<Leader>ws', '<C-w>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>wv', '<C-w>v', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Up>', ':echo "No up for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Down>', ':echo "No down for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Left>', ':echo "No left for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Right>', ':echo "No right for you!"<CR>', { silent = true })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
