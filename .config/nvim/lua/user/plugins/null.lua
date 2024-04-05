local M = {
	"nvimtools/none-ls.nvim",
	after = "neovim/nvim-lspconfig",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim", -- not real dependency
	},
}

function M.config()
	require("null-ls").setup({})
	local mason = require("mason-null-ls")

	mason.setup({
		ensure_installed = { "stylua" },
		automatic_installation = false,

		handlers = {
			function(source, methods)
				mason.default_setup(source, methods)
			end,
		},
	})
end

return M
