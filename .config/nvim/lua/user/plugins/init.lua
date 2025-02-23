local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local specs = {}
local function spec(item)
	table.insert(specs, { import = item })
end

spec("user.plugins.rosepine")
spec("user.plugins.icons")
spec("user.plugins.treesitter")
spec("user.plugins.blink")
spec("user.plugins.lsp")
spec("user.plugins.null")
spec("user.plugins.telescope")
spec("user.plugins.harpoon")
spec("user.plugins.oil")
spec("user.plugins.bqf")
spec("user.plugins.dap")
spec("user.plugins.neogit")
spec("user.plugins.ai")
spec("user.plugins.autopair")
spec("user.plugins.dressing")
spec("user.plugins.fidget")
spec("user.plugins.project")
spec("user.plugins.indent")
spec("user.plugins.gitsigns")
spec("user.plugins.zen")
spec("user.plugins.tmux")
spec("user.plugins.slimux")
spec("user.plugins.dial")

require("lazy").setup({
	spec = specs,

	change_detection = {
		enabled = true,
		notify = false,
	},

	ui = {
		icons = {
			ft = "",
			lazy = "(H) ",
			loaded = "",
			not_loaded = "",
			list = {
				"",
				"-",
				"-",
				"-",
			},
		},
	},
})
