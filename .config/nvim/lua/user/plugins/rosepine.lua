local M = {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
}

M.config = function()
	require("rose-pine").setup({
		highlight_groups = {
			-- statusline
			StatusLine = { fg = "love", bg = "love", blend = 10 },
			-- StatusLine = { fg = "foam", bg = "foam", blend = 10 }, # what my tmux is using
			StatusLineNC = { fg = "subtle", bg = "surface" },

			-- float
			FloatTitle = { link = "FloatBorder" },

			-- borderless telescope
			TelescopeBorder = { fg = "overlay", bg = "overlay" },
			TelescopeNormal = { fg = "subtle", bg = "overlay" },
			TelescopeSelection = { fg = "text", bg = "highlight_med" },
			TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
			TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

			TelescopeTitle = { fg = "overlay", bg = "overlay" },
			TelescopePromptTitle = { fg = "base", bg = "pine" },
			TelescopePreviewTitle = { fg = "base", bg = "iris" },

			TelescopePromptNormal = { fg = "text", bg = "surface" },
			TelescopePromptBorder = { fg = "surface", bg = "surface" },

			-- zen mode
			ZenBg = { link = "Normal" },

			-- panes
			WinSeparator = { fg = "#2e202f" },

			-- dap
			DapBreakpoint = { fg = "love" },
			DapBreakpointCondition = { fg = "gold" },
			DapLogPoint = { fg = "foam" },
			DapStopped = { fg = "pine" },

			-- nvim-dap-ui
			DapUIBreakpointsCurrentLine = { fg = "gold" },
			DapUIBreakpointsLine = { link = "LineNr" },
			DapUIBreakpointsPath = { fg = "love" },
			DapUIStoppedThread = { fg = "love" },
			DapUIDecoration = { fg = "subtle" },
			DapUILineNumber = { link = "LineNr" },
			DapUINormal = { fg = "text" },
			DapUINumber = { fg = "iris" },
			DapUIPlayPause = { fg = "pine" },
			DapUIRestart = { link = "DapUIPlayPause" },
			DapUIStepBack = { fg = "foam" },
			DapUIStepInto = { fg = "foam" },
			DapUIStepOut = { fg = "foam" },
			DapUIStepOver = { fg = "foam" },
			DapUIStop = { fg = "love" },
			DapUIType = { fg = "pine" },
			DapUIValue = { fg = "gold" },
			DapUIScope = { fg = "love" },

			-- syntax
			-- Number = { fg = "iris" }
		},
	})

	vim.opt.statusline = " %f %m %= %l:%c  "

	vim.cmd("colorscheme rose-pine")

	-- temporary fix
	vim.cmd("highlight WinBar guibg=NONE")
	vim.cmd("highlight WinBarNC guibg=NONE")
end

return M
