local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.maplocalleader = " "
vim.g.mapleader = " "
keymap("", "<Space>", "<Nop>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", { silent = true })
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", { silent = true })
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", { silent = true })
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", { silent = true })

keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<Tab>", ":BufferNext<CR>", opts)
keymap("n", "<S-x>", ":BufferDelete<CR>", opts)
keymap("n", "<S-Tab>", ":BufferPrevious<CR>", opts)

keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

keymap("n", "<Leader><Space>", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>fp", ":Telescope project<CR>", opts)
keymap("n", "<Leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<Leader>ft", ":Telescope live_grep<CR>", opts)

keymap("n", "<Leader>m", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<Leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<C-a>", ":lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<C-s>", ":lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<C-d>", ":lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<C-f>", ":lua require('harpoon.ui').nav_file(4)<CR>", opts)
