local M = {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
		"jay-babu/mason-null-ls.nvim", -- not real dependency
	},
}

function M.config()
	require("null-ls").setup({})
	local mason = require("mason-null-ls")

	mason.setup({
		ensure_installed = { "stylua", "pylint", "black" },
		automatic_installation = false,

		handlers = {
			mason.default_setup,

			["pylint"] = function() end,
		},
	})
end

return M
