local autocmd = vim.api.nvim_create_autocmd

-- press enter after comment
autocmd("BufWinEnter", {
	command = "set formatoptions-=cro",
})

-- auto resize splits
autocmd("VimResized", {
	command = "tabdo wincmd =",
})

-- highlight copied text
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

-- easily close stupid windows
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"git",
		"help",
		"man",
		"lspinfo",
		"oil",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"",
	},
	callback = function()
		vim.cmd([[
			nnoremap <silent> <buffer> q :close<CR>
			set nobuflisted
		]])
	end,
})
