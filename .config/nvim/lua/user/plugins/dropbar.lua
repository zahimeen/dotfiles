local M = {
	"Bekaboo/dropbar.nvim",
	dependencies = "nvim-telescope/telescope-fzf-native.nvim",
}

-- dropbar like doesnt show up all the time
-- got to like make an issue for that
-- to replicate, open the .bashrc in your $HOME

M.config = function()
	require("dropbar").setup({
		bar = {
			sources = function(buf, _)
				local sources = require('dropbar.sources')
				local utils = require('dropbar.utils')

				local filename = {
					get_symbols = function(buff, win, cursor)
						local symbols = sources.path.get_symbols(buff, win, cursor)
						return { symbols[#symbols] }
					end,
				}

				if vim.bo[buf].ft == 'markdown' then
					return {
						filename,
						sources.markdown,
					}
				end
				if vim.bo[buf].buftype == 'terminal' then
					return {
						sources.terminal,
					}
				end
				return {
					filename,
					utils.source.fallback({
						sources.lsp,
						sources.treesitter,
					}),
				}
			end
		},

		icons = {
			ui = {
				bar = {
					separator = "  ",
					extends = "…",
				},
			},
		},
	})
end

return M
