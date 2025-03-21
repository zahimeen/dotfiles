local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	init = function(plugin)
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
}

M.config = function()
	require("nvim-treesitter.configs").setup({
		sync_install = true,
		auto_install = true,
		ensure_installed = { "lua", "python", "rust", "go", "toml", "markdown" },
		ignore_install = {},
		modules = {},

		indent = { enable = true },
		highlight = {
			enable = true,
			disable = { "tmux" }
		},
	})
end

return M
