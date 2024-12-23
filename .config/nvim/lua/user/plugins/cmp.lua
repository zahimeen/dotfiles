local M = {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",

		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
			dependencies = {
				"rafamadriz/friendly-snippets",
				"saadparwaiz1/cmp_luasnip",
			},
		},
	},
}

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local select = { behavior = cmp.SelectBehavior.Select }

	-- loads friendly-snippets
	require("luasnip.loaders.from_vscode").lazy_load()

	cmp.setup({
		formatting = {
			expandable_indicator = true,
			fields = { "kind", "abbr", "menu" },
			format = require("lspkind").cmp_format({
				mode = "symbol_text",
				menu = {
					nvim_lsp = "lsp",
					nvim_lua = "vim",
					luasnip = "snp",
					buffer = "buf",
				},
			}),
		},

		window = {
			completion = {
				scrollbar = false,
				col_offset = -2,
			},
		},

		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			-- { name = "buffer" },
		},

		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_prev_item(select)
				elseif luasnip.locally_jumpable(-1) then
					luasnip.jump(-1)
				end
			end),

			["<C-n>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.select_next_item(select)
				elseif luasnip.locally_jumpable(1) then
					luasnip.jump(1)
				end
			end),

			["<C-space>"] = cmp.mapping(function()
				if cmp.visible() then
					cmp.confirm({ select = true })
				elseif luasnip.expandable() then
					luasnip.expand()
				end
			end),
		}),

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
	})

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "path" },
			{ name = "cmdline" },
		},
	})
end

return M
