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
    -- a = {description = {'   New File           '}, command = 'DashboardNewFile'},
    b = {description = {'   Find File          '}, command = 'Telescope find_files'},
    c = {description = {'   Recently Used Files'}, command = 'Telescope oldfiles'},
    d = {description = {'   Find Word          '}, command = 'Telescope live_grep'},
    -- e = {description = {' Bookmarks          '}, command = 'Startify'}
}

-- vim.cmd("autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Dashboard | endif")
vim.cmd("autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2")

