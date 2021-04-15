vim.api.nvim_set_keymap("n", "<Leader>tf", "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true, silent = true } )
vim.api.nvim_set_keymap("n", "<Leader>tg", "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true } )
vim.api.nvim_set_keymap("n", "<Leader>tb", "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true, silent = true } )
vim.api.nvim_set_keymap("n", "<Leader>th", "<cmd>lua require('telescope.builtin').help_tags()<CR>", { noremap = true, silent = true } )
vim.api.nvim_set_keymap("n", "<Leader>tr", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", { noremap = true, silent = true } )
