local options = vim.opt

local settings = {
	backup = false,
	writebackup = false,
	swapfile = false,

	fileencoding = "utf-8",
	clipboard = "unnamedplus",
	undofile = true,

	termguicolors = true,
	conceallevel = 0,
	hidden = true,

	ignorecase = true,
	incsearch = true,
	hlsearch = false,

	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,

	cursorline = true,
	cursorcolumn = false,
	colorcolumn = "80",

	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",

	cmdheight = 1,
	pumheight = 10,
	splitbelow = true,
	splitright = true,

	showtabline = 2,
	laststatus = 2,
	showmode = false,

	scrolloff = 8,
	sidescrolloff = 8,

	wrap = false,
	linebreak = true,

	updatetime = 300,
	timeoutlen = 500,
	completeopt = { "menuone", "noselect" },

	guifont = "Hack Nerd Font:h15.5",
	-- guicursor = "a:block",
}

for opt, set in pairs(settings) do
	options[opt] = set
end

options.shortmess:append("c")
options.whichwrap:append("<"):append(">"):append("["):append("]"):append("h"):append("l")
