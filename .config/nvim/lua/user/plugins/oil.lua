local M = {
	"stevearc/oil.nvim",
	-- if directory is opened, oil will not override netrw unless loaded
	lazy = false,

	keys = { { "<leader>e", "<cmd>Oil --float<cr>" } },
	opts = {
		float = {
			border = "single",
			max_height = 25,
			max_width = 65,
		},

		keymaps_help = {
			border = "single",
		},
	},
}

return M
