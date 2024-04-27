local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", "<space>", "")

map("n", "n", "nzz")
map("n", "N", "Nzz")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- clears search highlight and cmdline
map("n", "<esc>", "<cmd>noh | echo<cr>")

map("n", "<leader>wv", "<C-w>v")
map("n", "<leader>ws", "<C-w>s")
-- prolly already managed by tmux keymaps
-- map({ "n", "v", "i", "t" }, "<A-h>", "<C-w>h")
-- map({ "n", "v", "i", "t" }, "<A-l>", "<C-w>l")
-- map({ "n", "v", "i", "t" }, "<A-j>", "<C-w>j")
-- map({ "n", "v", "i", "t" }, "<A-k>", "<C-w>k")

-- quicker fixer windower
map("n", "<A-q>", "<cmd>cw<cr>")

-- terminal escape
map("t", "<C-;>", "<C-\\><C-n>") -- FIXME: its not working idk why

-- you can toggle an opt with !
map("n", "<leader>ke", "<cmd>set sc!<cr>")
map("n", "<leader>ln", "<cmd>set nu! rnu!<cr>")

map("n", "<leader>co", function()
	-- some freaky nvim bs don worry bout it lil bro
	---@diagnostic disable-next-line: undefined-field
	if vim.opt.colorcolumn._value == "" then
		vim.opt.colorcolumn = "80"
		return
	end
	vim.opt.colorcolumn = ""
end)

map("n", "<leader>so", function()
	local directory = vim.fn.expand("~/dotfiles/.config/nvim/lua/")
	local filepath = vim.fn.expand("%:p")

	if not (vim.opt_local.filetype._value == "lua") or not (filepath:sub(1, #directory) == directory) then
		vim.cmd.source()
		return
	end

	local modname = filepath:sub(#directory + 1):gsub("%..-$", ""):gsub("/", ".")

	package.loaded[modname] = nil
	local returns = require(modname)
	if type(returns) == "table" and type(returns.config) == "function" then
		returns.config()
		return
	end
end)
