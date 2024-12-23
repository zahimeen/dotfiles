local M = {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	keys = {
		{ "m", "<cmd>DapToggleBreakpoint<cr>" },
		{ "M", "<cmd>DapBreakpointCondition<cr>" },
		{ "<leader>dj", "<cmd>DapContinue<cr>" },
		{ "<leader>dk", "<cmd>DapStepInto<cr>" },
		{ "<leader>do", "<cmd>DapUIToggle<cr>" },
		{ "<leader>dr", "<cmd>DapRunLast<cr>" },
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
				mason.default_setup(config)
			end,
		},
	})

	local sign_define = vim.fn.sign_define
	local create_cmd = vim.api.nvim_create_user_command

	create_cmd("DapRunLast", dap.run_last, {})
	create_cmd("DapUIToggle", dapui.toggle, {})
	create_cmd("DapBreakpointCondition", function()
		vim.ui.input({ prompt = "Breakpoint Condition" }, function(input)
			dap.set_breakpoint(input)
		end)
	end, {})

	-- highlights at user.plugins.rosepine
	sign_define("DapBreakpoint", { text = "B", texthl = "DapBreakpoint", linehl = "", numhl = "" })
	sign_define("DapBreakpointCondition", { text = "C", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
	sign_define("DapLogPoint", { text = "L", texthl = "DapLogPoint", linehl = "", numhl = "" })
	sign_define("DapStopped", { text = "❯", texthl = "DapStopped", linehl = "", numhl = "" })
	sign_define("DapBreakpointRejected", { text = "❯", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

	dap.listeners.before.launch.dapui_config = dapui.open
	dap.listeners.before.attach.dapui_config = dapui.open
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
			vim.keymap.set("n", "q", dapui.toggle)
			vim.cmd("set cursorlineopt=number")
		end,
	})
end

return M
