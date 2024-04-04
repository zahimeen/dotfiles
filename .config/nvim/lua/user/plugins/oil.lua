local M = {
	"stevearc/oil.nvim",
	event = "VeryLazy",
}

M.config = function()
	local oil = require("oil")

	oil.setup({
		float = {
			border = "single",
			max_height = 20,
			max_width = 60,
		},

		keymaps_help = {
			border = "single",
		},
	})

	vim.keymap.set("n", "<leader>e", oil.toggle_float, { noremap = true, silent = true })
end

return M
