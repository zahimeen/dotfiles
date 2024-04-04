local M = {
	"numToStr/Comment.nvim",
	event = "VeryLazy",
}

M.config = function()
	vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
	vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")
end

return M
