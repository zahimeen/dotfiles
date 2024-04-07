local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = "nvim-lua/plenary.nvim",
}

M.config = function()
	local harpoon = require("harpoon")

	harpoon:setup({})

	vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
	vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

	-- quick swap
	vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
	vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
	vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
	vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

	-- toggle previous & next buffers stored within Harpoon list
	vim.keymap.set("n", "<c-p>", function() harpoon:list():prev() end)
	vim.keymap.set("n", "<c-n>", function() harpoon:list():next() end)
end

return M
