local M = {
	"EvWilson/slimux.nvim",
	event = "VeryLazy",
}

M.config = function()
	local slimux = require("slimux")

	local target_window = slimux.get_tmux_window()
	local target_pane = string.format("%s.2", target_window)

	slimux.setup({
		target_socket = slimux.get_tmux_socket(),
		target_pane = target_pane,
	})

	local function sendcmd()
		vim.ui.input({ prompt = "Command" }, function(input)
			if not input then
				return
			end

			local filepath = vim.fn.expand("%:.")
			input = string.gsub(input, "%%", filepath)
			slimux.send(input)
		end)
	end

	local persistent
	local function sendpersistent()
		slimux.send(persistent)
	end

	local function setpersistent()
		vim.ui.input({ prompt = "Persistent Command" }, function(input)
			if not input or input == "" then
				vim.keymap.set("n", "<leader>r", sendcmd)
				return
			end

			local filepath = vim.fn.expand("%:.")
			persistent = string.gsub(input, "%%", filepath)
			vim.keymap.set("n", "<leader>r", sendpersistent)
		end)
	end

	vim.keymap.set("n", "<leader>r", sendcmd)
	vim.keymap.set("n", "<leader>R", setpersistent)
end

return M
