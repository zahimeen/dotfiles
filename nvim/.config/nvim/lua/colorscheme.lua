vim.cmd("set t_8f=[[38;2;%lu;%lu;%lum")
vim.cmd("set t_8b=[[48;2;%lu;%lu;%lum")

vim.cmd("hi! Normal ctermbg=NONE guibg=NONE")
vim.cmd("hi! NonText ctermbg=NONE guibg=NONE")

vim.g.nvcode_termcolors = 256
vim.cmd("colorscheme lunar")
