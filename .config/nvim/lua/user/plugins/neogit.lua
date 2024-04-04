local M = {
	"NeogitOrg/neogit",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
	},
}

M.config = function()
	local diffview = require("diffview")
	diffview.setup({
		show_help_hints = false,
	})

	local neogit = require("neogit")
	neogit.setup({})

	vim.keymap.set("n", "<leader>gg", neogit.open, {})
	vim.keymap.set("n", "<leader>gc", function() neogit.open({ "commit" }) end, {})
end

return M
