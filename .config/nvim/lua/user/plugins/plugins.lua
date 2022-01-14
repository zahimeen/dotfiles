return {
	{ "wbthomason/packer.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/nvim-lsp-installer" },
	{ "lewis6991/impatient.nvim" },

	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("user.plugins.configs.treesitter")
		end,
	},

	{
		"rafamadriz/friendly-snippets",
		requires = "L3MON4D3/LuaSnip",
	},

	{
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("user.plugins.configs.cmp")
		end,
	},

    {
        "ThePrimeagen/harpoon",
        requires = "nvim-lua/plenary.nvim",
    },

	{
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
		},
		config = function()
			require("user.plugins.configs.telescope")
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("user.plugins.configs.autopairs")
		end,
	},

	{
		"goolord/alpha-nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("user.plugins.configs.alpha")
		end,
	},

	{
		"numToStr/Comment.nvim",
		requires = "JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("user.plugins.configs.comment")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("user.plugins.configs.gitsigns")
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("user.plugins.configs.colorizer")
		end,
	},

	{
		"romgrk/barbar.nvim",
		event = "BufWinEnter",
		requires = "kyazdani42/nvim-web-devicons",
	},
}
