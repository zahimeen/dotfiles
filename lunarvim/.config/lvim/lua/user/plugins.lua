lvim.plugins = {
	{ "zahin-muhaimeen/onedark.nvim" },

	{
		"hoob3rt/lualine.nvim",
		event = "BufWinEnter",
		config = function()
			require("user.lualine").setup()
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("user.colorizer").setup()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("user.blankline")
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = function()
			require("user.zen").config()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
	},
}
