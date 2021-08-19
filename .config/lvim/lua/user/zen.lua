local M = {}

M.setup = function()
	local status_ok, zen_mode = pcall(require, "zen-mode")
	if not status_ok then
		return
	end

	zen_mode.setup({
		window = {
			backdrop = 0.95,
			height = 0.95,
			width = 0.85,
			options = {
				signcolumn = "no",
				number = false,
				relativenumber = false,
			},
		},
		plugins = {
			gitsigns = { enabled = false },
			tmux = { enabled = false },
			twilight = { enabled = true },
		},
	})
end

return M
