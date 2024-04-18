local M = {
	"aserowy/tmux.nvim",
	event = "VeryLazy",
}

M.config = function()
	local tmux = require("tmux")
	tmux.setup({
		copy_sync = { enable = false },
		navigation = { enable_default_keybindings = false },
		resize = { enable_default_keybindings = false },
	})

	local map = vim.keymap.set
	map({ "n", "v", "i", "t" }, "<A-h>", tmux.move_left)
	map({ "n", "v", "i", "t" }, "<A-l>", tmux.move_right)
	map({ "n", "v", "i", "t" }, "<A-j>", tmux.move_bottom)
	map({ "n", "v", "i", "t" }, "<A-k>", tmux.move_top)

	map({ "n", "v", "i", "t" }, "<C-h>", tmux.resize_left)
	map({ "n", "v", "i", "t" }, "<C-l>", tmux.resize_right)
	map({ "n", "v", "i", "t" }, "<C-j>", tmux.resize_bottom)
	map({ "n", "v", "i", "t" }, "<C-k>", tmux.resize_top)
end

return M
