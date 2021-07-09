vim.cmd([[
augroup fmt
    autocmd!
    autocmd BufWritePre * Neoformat
augroup END
]])

vim.g.neoformat_basic_format_align = 1
vim.g.neoformat_basic_format_retab = 1
vim.g.neoformat_basic_format_trim = 1

vim.g.neoformat_only_msg_on_error = 1
vim.g.neoformat_run_all_formatters = 0

vim.g.neoformat_enabled_javascript = { "prettier" }

vim.cmd([[if exists('#autoformat#BufWritePre')
	:autocmd! autoformat
	endif]])
