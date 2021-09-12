lvim.colorscheme = "onedarker"

vim.cmd("autocmd FileType dashboard lua require('user.aesthetics').hl_dashboard()")

local M = {}
M.hl_dashboard = function ()
    vim.cmd("highlight DashboardHeader guifg=#5c6370")
    vim.cmd("highlight DashboardCenter guifg=#5c6370")
    vim.cmd("highlight DashboardFooter guifg=#5c6370")
end
return M
