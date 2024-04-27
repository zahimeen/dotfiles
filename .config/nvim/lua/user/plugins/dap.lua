local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
		"Weissle/persistent-breakpoints.nvim",
	},
}

M.config = function()
	local dap = require("dap")
	local dapui = require("dapui")
	local mason = require("mason-nvim-dap")

	dapui.setup()
	require("nvim-dap-virtual-text").setup({ virt_text_pos = "eol" })

	local data = vim.fn.stdpath("data")
	mason.setup({
		ensure_installed = { "python" },

		handlers = {
			mason.default_setup,

			["python"] = function(config)
				config.adapters = {
					type = "executable",
					command = data .. "/mason/packages/debugpy/venv/bin/python",
					args = {
						"-m",
						"debugpy.adapter",
					},
				}
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	})

	dap.listeners.before.attach.dapui_config = dapui.open
	dap.listeners.before.launch.dapui_config = dapui.open
	dap.listeners.before.event_terminated.dapui_config = dapui.close
	dap.listeners.before.event_exited.dapui_config = dapui.close

	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = {
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dapui_console",
			"dap-repl",
		},
		callback = function()
			vim.keymap.set("n", "q", dapui.toggle, { silent = true, buffer = true })
		end,
	})

	require("persistent-breakpoints").setup({
		load_breakpoints_event = { "BufReadPost" },
		save_dir = data .. "/dap/breakpoints",
	})

	local persistent = require("persistent-breakpoints.api")

	vim.keymap.set("n", "<leader>dj", dap.continue)
	vim.keymap.set("n", "<leader>dk", dap.step_into)
	vim.keymap.set("n", "<leader>do", dapui.toggle)
	vim.keymap.set("n", "m", persistent.toggle_breakpoint)
	vim.keymap.set("n", "M", persistent.set_conditional_breakpoint)
	vim.keymap.set("n", "<leader>dc", persistent.clear_all_breakpoints)

	-- highlights at user.plugins.rosepine
	vim.fn.sign_define("DapBreakpoint", { text = "B", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointCondition", { text = "C", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
	vim.fn.sign_define("DapLogPoint", { text = "L", texthl = "DapLogPoint", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "❯", texthl = "DapStopped", linehl = "", numhl = "" })
end

return M
