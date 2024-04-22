local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	},
}

M.config = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local select = { behavior = cmp.SelectBehavior.Select }

	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item(select),
			["<C-n>"] = cmp.mapping.select_next_item(select),
			["<C-Space>"] = cmp.mapping.confirm({ select = true }),
		}),

		formatting = {
			expandable_indicator = false,
			fields = { "kind", "abbr", "menu" },
			format = function(entry, item)
				local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })

				kind.kind = " " .. (strings[1] or "") .. " "
				kind.menu = "    (" .. (strings[2] or "") .. ")"

				return kind
			end,
		},

		sources = {
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "calc" },
			{ name = "buffer" },
		},

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
