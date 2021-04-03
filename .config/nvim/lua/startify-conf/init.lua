vim.g.startify_custom_header = {
    '   ██████╗  ██████╗  ██████╗ ██╗  ██╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗',
    '   ██╔══██╗██╔═══██╗██╔═══██╗██║ ██╔╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝',
    '   ██████╔╝██║   ██║██║   ██║█████╔╝ ██╔████╔██║███████║██████╔╝█████╔╝ ███████╗',
    '   ██╔══██╗██║   ██║██║   ██║██╔═██╗ ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ╚════██║',
    '   ██████╔╝╚██████╔╝╚██████╔╝██║  ██╗██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████║',
    '   ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝'
}

vim.g.webdevicons_enable_startify = 1
vim.g.startify_enable_special = 0
vim.g.startify_disable_at_vimenter = 0

vim.api.nvim_exec(
    'let startify_lists = [ { \'type\': \'bookmarks\', \'header\': [\'   Bookmarks\'] },                                                                   ]',
    true)

vim.api.nvim_exec(
    'let startify_bookmarks = [ { \'c\': \'~/.config/qtile/config.py\' }, { \'z\': \'~/.zshrc\' }, { \'i\': \'~/.config/nvim/init.lua\' }]',
    true)

vim.api.nvim_set_keymap('n', '<Leader>sb', ':Startify<CR>', { noremap = true, silent = true } )
