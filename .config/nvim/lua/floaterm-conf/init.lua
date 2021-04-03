vim.g.floaterm_opener = "edit"
vim.g.floaterm_autoclose = 1

vim.api.nvim_set_keymap('n', '<Leader>tn', ':FloatermNew --height=0.7 --width=0.8 --wintype=float --name=blankterm<CR>', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('n', '<Leader>tf', ':FloatermNew --height=0.7 --width=0.8 --wintype=float --name=ranger ranger<CR>', { noremap = true, silent = true } )

vim.api.nvim_set_keymap('n', '<Leader>trp', ':FloatermNew --height=0.7 --width=0.8 --wintype=float --name=run python %<CR>', { noremap = true, silent = true } )
