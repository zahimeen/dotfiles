local M = {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
}

function M.config()
	local null = require("null-ls")
	null.setup({})

	local mason = require("mason-null-ls")
	mason.setup({
		ensure_installed = { "stylua", "selene", "autopep8" },
		automatic_installation = false,

		handlers = {
			mason.default_setup,

			["selene"] = function()
				if vim.opt.filetype._value == "luau" then
					null.register(null.builtins.diagnostics.selene)
				end
			end,

			["autopep8"] = function()
				null.register(require("none-ls.formatting.autopep8"))
			end,
		},
	})
end

return M
