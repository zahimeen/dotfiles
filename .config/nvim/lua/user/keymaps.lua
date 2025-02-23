---@diagnostic disable: undefined-field
-- some freaky lsp stuff don worry bout it

local map = vim.keymap.set
local del = vim.keymap.del

vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", "<space>", "")

map("n", "n", "nzz")
map("n", "N", "Nzz")
map("v", ">", ">gv")
map("v", "<", "<gv")

-- navigate through wrapped lines
map("n", "<leader>wr", function()
	if vim.opt.wrap._value then
		vim.opt.wrap = false
		del({ "n", "v" }, "j")
		del({ "n", "v" }, "k")
		vim.notify("Wrap disabled")
		return
	end

	vim.opt.wrap = true
	map({ "n", "v" }, "j", "gj")
	map({ "n", "v" }, "k", "gk")
	vim.notify("Wrap enabled")
end)

-- clears search highlight and cmdline
map("n", "<esc>", "<cmd>noh | echo<cr>")

map("n", "<leader>v", "<C-w>v")
map("n", "<leader>s", "<C-w>s")
-- map({ "n", "v", "i", "t" }, "<A-h>", "<C-w>h")
-- map({ "n", "v", "i", "t" }, "<A-l>", "<C-w>l")
-- map({ "n", "v", "i", "t" }, "<A-j>", "<C-w>j")
-- map({ "n", "v", "i", "t" }, "<A-k>", "<C-w>k")
-- above commented mappings are handled by tmux.nvim plugins

-- quicker fixer windower
map("n", "<A-q>", "<cmd>cw<cr>")

-- terminal escape
map("t", "<A-;>", "<C-\\><C-n>") -- FIXME: its not working idk why

-- you can toggle an opt with !
map("n", "<leader>ke", "<cmd>set sc!<cr>")
map("n", "<leader>ln", "<cmd>set nu! rnu!<cr>")

local function toggle_colorcolumn(val)
	if vim.opt.colorcolumn._value ~= val then
		vim.opt.colorcolumn = val
	end

	vim.opt.colorcolumn = ""
end

map("n", "<leader>co", function() toggle_colorcolumn("120") end)
map("n", "<leader>cO", function() toggle_colorcolumn("80") end)

map("n", "<leader>S", function()
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
