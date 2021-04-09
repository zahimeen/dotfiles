vim.g.floaterm_opener = "edit"
vim.g.floaterm_autoclose = 1

vim.api.nvim_set_keymap('n', '<Leader>tn', ':FloatermNew --height=0.7 --width=0.8 --wintype=float --name=blankterm<CR>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('n', '<Leader>tf', ':FloatermNew --height=0.7 --width=0.8 --wintype=float --name=ranger ranger<CR>', { noremap = true, silent = true } )

vim.api.nvim_set_keymap('n', '<Leader>rp', ':w | :FloatermNew --height=0.8 --width=0.9 --wintype=float --autoclose=0 --name=run python %<CR>', { noremap = true, silent = true } )
