local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { -- none of these are real dependencies
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
		"folke/neoconf.nvim",
		"hrsh7th/cmp-nvim-lsp", -- sets up for cmp
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
	map("n", "gj", vim.diagnostic.goto_next, opts)
	map("n", "gk", vim.diagnostic.goto_prev, opts)
	map("n", "gs", vim.diagnostic.setloclist, opts)
	map("n", "K", lsp.hover, opts)

	map("n", "<leader>wa", lsp.add_workspace_folder, opts)
	map("n", "<leader>wr", lsp.remove_workspace_folder, opts)
	map("n", "<leader>wl", function()
		print(vim.inspect(lsp.list_workspace_folders()))
	end, opts)

	map("n", "<leader>d", lsp.type_definition, opts)
	map("n", "<leader>lr", lsp.rename, opts)
	map("n", "<leader>lf", function()
		lsp.format({ async = true })
	end, opts)
	map({ "n", "v" }, "<leader>ca", lsp.code_action, opts)

	local function toggle_hints()
		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
			return true
		end
	end

	map("n", "gh", function()
		if not toggle_hints() then
			error("No hints for " .. client.name)
		end
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

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "tsserver", "pyright" },
		automatic_installation = false,
	})

	require("mason-lspconfig").setup_handlers({
		handler,

		["lua_ls"] = function()
			require("neodev").setup()
			handler("lua_ls")
		end,
	})
end

return M
