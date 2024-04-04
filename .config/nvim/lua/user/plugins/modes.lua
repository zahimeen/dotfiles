local M = {
	"mvllow/modes.nvim",
	-- commit = "57fb7a8", -- make a pull request later for legacy options
	event = "VeryLazy",
}

M.config = function()
	require("modes").setup({
		set_cursor = false, -- https://github.com/mvllow/modes.nvim/issues/50
	})

	vim.opt.cursorlineopt = "both"
end

return M
