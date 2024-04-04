local M = {
	"nvim-tree/nvim-web-devicons",
	"onsails/lspkind.nvim",
	event = "VeryLazy",
}

M.config = function ()
	require("nvim-web-devicons")
end

return M
