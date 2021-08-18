-- helpers
local opt = vim.opt
local keys = lvim.keys
local builtin = lvim.builtin

function table.removekey(table, key)
	local element = table[key]
	table[key] = nil
	return element
end

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedark"
lvim.lsp.diagnostics.virtual_text = false

-- vim settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.colorcolumn = "80"
opt.hlsearch = false

-- plugins
builtin.dashboard = {
	active = true,
	custom_header = {
		"██╗     ██╗   ██╗███╗   ██╗ █████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
		"██║     ██║   ██║████╗  ██║██╔══██╗██╔══██╗██║   ██║██║████╗ ████║",
		"██║     ██║   ██║██╔██╗ ██║███████║██████╔╝██║   ██║██║██╔████╔██║",
		"██║     ██║   ██║██║╚██╗██║██╔══██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║",
		"███████╗╚██████╔╝██║ ╚████║██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
		"╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
	},
	custom_section = {
		c = { description = { "  Recents                   SPC f r" }, command = "Telescope oldfiles" },
		d = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
		e = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
		f = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
		g = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" },
	},
	custom_footer = {
		"  VSCode Is Slower Than A Snale!",
	},
}
builtin.terminal.active = true
builtin.telescope.active = true
builtin.nvimtree.side = "left"
builtin.nvimtree.show_icons.git = 1

builtin.treesitter.ensure_installed = "all"
builtin.treesitter.ignore_install = { "php" }
builtin.treesitter.playground.enable = true
builtin.treesitter.highlight.enabled = true
builtin.treesitter.indent.disable = { "python" }

lvim.plugins = {
	{
		"LunarVim/Colorschemes",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("user.blankline").setup()
		end,
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("user.zen").setup()
		end,
	},
	{
		"nvim-treesitter/playground",
		event = "BufRead",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("user.colorizer").setup()
		end,
	},
	{
		"KabbAmine/vCoolor.vim",
		event = "BufEnter",
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}

-- keymappings
lvim.leader = "space"

keys.insert_mode = {}

keys.normal_mode["<Tab>"] = "<cmd>BufferNext<CR>"
keys.normal_mode["<S-Tab>"] = "<cmd>BufferPrevious<CR>"
keys.normal_mode["<S-x>"] = "<cmd>BufferDelete<CR>"
table.removekey(keys.insert_mode, "jk")
table.removekey(keys.insert_mode, "kj")

builtin.which_key.mappings.z = { "<cmd>ZenMode<CR>", "Toggle Zen Mode" }
builtin.which_key.mappings.w = {
	name = "Windows",
	h = { "<C-w>h", "Window Left" },
	j = { "<C-w>j", "Window Down" },
	k = { "<C-w>k", "Window Up" },
	l = { "<C-w>l", "Window Right" },
	s = { "<C-w>s", "Window Split" },
	v = { "<C-w>v", "Window Vertical Split" },
}

builtin.which_key.mappings.f = {
	name = "Files",
	f = { "<cmd>Telescope find_files<CR>", "Find Files" },
	g = { "<cmd>Telescope git_files<CR>", "Find Git Files" },
	r = { "<cmd>Telescope oldfiles<CR>", "Find Recent Files" },
	w = { "<cmd>Telescope live_grep<CR>", "Find Word In File" },
	p = { "<cmd>Telescope projects<CR>", "Find Recent Project" },
}

builtin.which_key.mappings.b = {
	name = "Buffers",
	n = { "<cmd>BufferNext<CR>", "Buffer Next" },
	p = { "<cmd>BufferPrevious<CR>", "Buffer Previous" },
	d = { "<cmd>BufferDelete<CR>", "Buffer Delete" },
	j = { "<cmd>BufferPick<CR>", "Buffer Pick" },
	l = { "<cmd>BufferLast<CR>", "Buffer Last" },
}

builtin.which_key.mappings.s = {
	name = "Sessions",
	s = { "<cmd>SessionSave<CR>", "Session Save" },
	l = { "<cmd>SessionLoad<CR>", "Session Load" },
}

table.removekey(builtin.which_key.mappings, "h")
table.removekey(builtin.which_key.mappings, "q")
