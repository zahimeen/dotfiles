local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	dependencies = {
		"Darazaki/indent-o-matic",
		config = true,
	},
}

M.config = function()
	require("ibl").setup({
		scope = { enabled = false },
	})

	-- dont show first indent line
	local hooks = require("ibl.hooks")
	hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
	hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
end

return M
