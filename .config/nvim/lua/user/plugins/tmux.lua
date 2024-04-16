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
	map({ "n", "v", "i" }, "<A-h>", tmux.move_left)
	map({ "n", "v", "i" }, "<A-l>", tmux.move_right)
	map({ "n", "v", "i" }, "<A-j>", tmux.move_bottom)
	map({ "n", "v", "i" }, "<A-k>", tmux.move_top)

	map({ "n", "v", "i" }, "<C-h>", tmux.resize_left)
	map({ "n", "v", "i" }, "<C-l>", tmux.resize_right)
	map({ "n", "v", "i" }, "<C-j>", tmux.resize_bottom)
	map({ "n", "v", "i" }, "<C-k>", tmux.resize_top)
end

return M
