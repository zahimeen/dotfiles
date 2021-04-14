vim.g.dashboard_custom_header = {
    '███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
    '████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
    '██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
    '██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
    '██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
    '╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝'
}

vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
    a = {description = {' Find File          '}, command = 'Telescope find_files'},
    b = {description = {' Recently Used Files'}, command = 'Telescope oldfiles'},
    c = {description = {' Find Word          '}, command = 'Telescope live_grep'},
    -- d = {description = {' Bookmarks          '}, command = 'Startify'}
}

vim.cmd("autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Dashboard | endif")
vim.cmd("autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2")

