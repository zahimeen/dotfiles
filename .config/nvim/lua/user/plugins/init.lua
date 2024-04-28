local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local specs = {}
local function spec(item)
	table.insert(specs, { import = item })
end

spec("user.plugins.rosepine")
spec("user.plugins.icons")
spec("user.plugins.treesitter")
spec("user.plugins.cmp")
spec("user.plugins.lsp")
spec("user.plugins.null")
spec("user.plugins.telescope")
spec("user.plugins.harpoon")
spec("user.plugins.oil")
spec("user.plugins.bqf")
spec("user.plugins.dap")
spec("user.plugins.neogit")
spec("user.plugins.dropbar")
spec("user.plugins.ai")
spec("user.plugins.autopair")
spec("user.plugins.codeium")
spec("user.plugins.dressing")
spec("user.plugins.fidget")
spec("user.plugins.project")
spec("user.plugins.indent")
spec("user.plugins.gitsigns")
spec("user.plugins.zen")
spec("user.plugins.tmux")
spec("user.plugins.slimux")
-- spec("user.plugins.modes")

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
				-- TODO: find better icons
				"➜",
				"★",
				"‒",
			}
		},
	},
})
