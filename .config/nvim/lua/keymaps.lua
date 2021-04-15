vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<TAB>', '<cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', '<cmd>BufferDelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bn', '<cmd>BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', '<cmd>BufferPrevious<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ws', '<C-w>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>rh', '<cmd>vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rj', '<cmd>resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rk', '<cmd>resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rl', '<cmd>vertical resize -5<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Up>', '<cmd>echo "No up for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<cmd>echo "No down for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<cmd>echo "No left for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<cmd>echo "No right for you!"<CR>', { silent = true })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })
