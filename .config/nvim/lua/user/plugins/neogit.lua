local M = {
	"NeogitOrg/neogit",
	keys = { { "<leader>gg", "<cmd>Neogit<cr>" } },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
}

M.config = function()
	local diffview = require("diffview")
	diffview.setup({ show_help_hints = false })

	local neogit = require("neogit")
	neogit.setup({})
end

return M
