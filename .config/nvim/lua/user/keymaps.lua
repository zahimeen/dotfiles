local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", "<space>", "")

map("n", "n", "nzz")
map("n", "N", "Nzz")
map("v", ">", ">gv")
map("v", "<", "<gv")

map("n", "<esc>", "<cmd>noh<cr>")

map("n", "<leader>wv", "<C-w>v")
map("n", "<leader>ws", "<C-w>s")
map({ "n", "v", "i" }, "<A-h>", "<C-w>h")
map({ "n", "v", "i" }, "<A-l>", "<C-w>l")
map({ "n", "v", "i" }, "<A-j>", "<C-w>j")
map({ "n", "v", "i" }, "<A-k>", "<C-w>k")

-- terminal escape
map("t", "<C-;>", "<C-\\><C-n>") -- FIXME: its not working idk why

-- you can toggle an opt with !
map("n", "<leader>so", "<cmd>set sc!<cr>")
map("n", "<leader>rn", "<cmd>set nu! rnu!<cr>")
