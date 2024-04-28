local M = {
	"mfussenegger/nvim-dap",
	keys = {
		{ "m",          "<cmd>DapToggleBreakpoint<cr>" },
		{ "M",          "<cmd>DapBreakpointCondition<cr>" },
		{ "<leader>dj", "<cmd>DapContinue<cr>" },
		{ "<leader>dk", "<cmd>DapStepInto<cr>" },
		{ "<leader>dc", "<cmd>DapClearBreakpoints<cr>" },
		{ "<leader>do", "<cmd>DapUIToggle<cr>" },
	},
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
		-- load_breakpoints_event = { "BufReadPost" },
		save_dir = data .. "/dap/breakpoints",
	})

	local persistent = require("persistent-breakpoints.api")

	local create_cmd = vim.api.nvim_create_user_command
	local sign_define = vim.fn.sign_define

	create_cmd("DapUIToggle", dapui.toggle, {})
	create_cmd("DapToggleBreakpoint", persistent.toggle_breakpoint, {})
	create_cmd("DapBreakpointCondition", persistent.set_conditional_breakpoint, {})
	create_cmd("DapClearBreakpoints", persistent.clear_all_breakpoints, {})

	-- highlights at user.plugins.rosepine
	sign_define("DapBreakpoint", { text = "B", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	sign_define("DapBreakpointCondition", { text = "C", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
	sign_define("DapLogPoint", { text = "L", texthl = "DapLogPoint", linehl = "", numhl = "" })
	sign_define("DapStopped", { text = "❯", texthl = "DapStopped", linehl = "", numhl = "" })
	sign_define("DapBreakpointRejected", { text = "❯", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

	dap.listeners.before.launch.dapui_config = function()
		persistent.load_breakpoints()
		dapui.open()
	end
	dap.listeners.before.attach.dapui_config = dapui.open
	dap.listeners.before.event_terminated.dapui_config = dapui.close
	dap.listeners.before.event_exited.dapui_config = dapui.close
end

return M
