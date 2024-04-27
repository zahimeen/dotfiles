local M = {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
}

M.config = function()
	-- TODO: make the statusline on the window
	-- TODO: make the winbar stay
	local zen = require("zen-mode")

	vim.keymap.set("n", "<leader>z", function()
		zen.toggle({
			window = {
				backdrop = 1, -- look at rosepine hl group "ZenBg"
				width = 90,
				options = {
					number = false,
					relativenumber = false,
					laststatus = 3,
				}
			},

			plugins = {
				tmux = { enabled = true },
				gitsigns = { enabled = true }
			},

			on_open = function ()
				vim.cmd("IBLDisable")
			end,

			on_close = function ()
				vim.cmd("IBLEnable")
			end
		})
	end)
end

return M
