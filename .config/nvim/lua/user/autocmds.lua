vim.cmd([[
    autocmd BufWritePost $XDG_CONFIG_HOME/nvim/* PackerCompile

    augroup _alpha
        autocmd!
        autocmd User AlphaReady set showtabline=0 laststatus=0 | autocmd BufUnload <buffer> set showtabline=2 laststatus=2
    augroup end
]])
