local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { -- none of these are real dependencies
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neoconf.nvim",
		"hrsh7th/cmp-nvim-lsp", -- sets up for cmp
		{ "folke/lazydev.nvim", ft = "lua" },
	},
}

local function on_attach(client, bufnr)
	local map = vim.keymap.set
	local lsp = vim.lsp.buf
	local opts = { buffer = bufnr }

	map("n", "gD", lsp.declaration, opts)
	map("n", "gd", lsp.definition, opts)
	map("n", "gi", lsp.implementation, opts)
	map("n", "gr", lsp.references, opts)
	map("n", "gl", vim.diagnostic.open_float, opts)
	map("n", "gs", vim.diagnostic.setloclist, opts)

	map("n", "gj", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, opts)
	map("n", "gk", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, opts)

	map("n", "K", lsp.hover, opts)

	map("n", "<leader>wa", lsp.add_workspace_folder, opts)
	map("n", "<leader>wd", lsp.remove_workspace_folder, opts)
	map("n", "<leader>wl", function()
		print(vim.inspect(lsp.list_workspace_folders()))
	end, opts)

	map("n", "<leader>d", lsp.type_definition, opts)
	map("n", "<leader>lr", lsp.rename, opts)
	map("n", "<leader>lf", function()
		lsp.format({ async = true })
	end, opts)
	map({ "n", "v" }, "<leader>ca", lsp.code_action, opts)

	map("n", "gh", function()
		if client.supports_method("textDocument/inlayHint") then
			return vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }))
		end
		vim.notify("No hints for " .. client.name, vim.log.levels.WARN)
	end, opts)
end

M.config = function()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	require("neoconf").setup()

	local function handler(server)
		local opts = {
			on_attach = on_attach,
			capabilities = capabilities,
		}

		lspconfig[server].setup(opts)
	end

	require("mason").setup({
		ui = {
			icons = {
				package_installed = "󰄳 ",
				package_pending = " ",
				package_uninstalled = " ",
			},
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "luau_lsp", "ts_ls", "pyright" },
		automatic_installation = false,
	})

	require("mason-lspconfig").setup_handlers({
		handler,

		["lua_ls"] = function()
			require("lazydev").setup()
			handler("lua_ls")
		end,
	})
end

return M
