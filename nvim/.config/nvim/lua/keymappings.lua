vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferDelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bn', ':BufferNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>bp', ':BufferPrevious<CR>', { noremap = true, silent = true })

-- Window Movement
vim.api.nvim_set_keymap('n', '<leader>wh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wl', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Window Creation
vim.api.nvim_set_keymap('n', '<leader>ws', '<C-w>s', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true })

-- Window Sizing
vim.api.nvim_set_keymap('n', '<leader>rh', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rj', ':resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rk', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rl', ':vertical resize -5<CR>', { noremap = true, silent = true })

-- Indentation
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Disabling Arrow Keys
vim.api.nvim_set_keymap('n', '<Up>', ':echo "No up for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Down>', ':echo "No down for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Left>', ':echo "No left for you!"<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<Right>', ':echo "No right for you!"<CR>', { silent = true })
