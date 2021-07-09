local M = {}

M.config = function()
    local g = vim.g

    g.dashboard_disable_at_vimenter = 0
    g.dashboard_disable_statusline = 1
    g.dashboard_default_executive = "telescope"
    g.dashboard_custom_header = {
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
    }

    g.dashboard_custom_section = {
        a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
        b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
        c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
        d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
        f = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" },
    }

    g.dashboard_custom_footer = {
        "   ",
        "  Emacs Is Slower Than A Snale!",
    }
end

require("conf-utils").define_augroups({
    _dashboard = {
        -- seems to be nobuflisted that makes my stuff disapear will do more testing
        {
            "FileType",
            "dashboard",
            "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
        },
        {
            "FileType",
            "dashboard",
            "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2",
        },
        { "FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>" },
    },
})

return M
