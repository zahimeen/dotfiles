colors = require("colorscheme.colors")
local highlight = require("colorscheme.highlight")
local skeletons = require("colorscheme.skeletons")

vim.api.nvim_command("hi clear")
vim.api.nvim_command("syntax reset")

vim.g.terminal_color_0 = colors.base00
vim.g.terminal_color_1 = colors.base08
vim.g.terminal_color_2 = colors.base0B
vim.g.terminal_color_3 = colors.base0A
vim.g.terminal_color_4 = colors.base0D
vim.g.terminal_color_5 = colors.base0E
vim.g.terminal_color_6 = colors.base0C
vim.g.terminal_color_7 = colors.base05
vim.g.terminal_color_8 = colors.base03
vim.g.terminal_color_9 = colors.base08
vim.g.terminal_color_10 = colors.base0B
vim.g.terminal_color_11 = colors.base0A
vim.g.terminal_color_12 = colors.base0D
vim.g.terminal_color_13 = colors.base0E
vim.g.terminal_color_14 = colors.base0C
vim.g.terminal_color_15 = colors.base07
vim.g.terminal_color_background = colors.base00
vim.g.terminal_color_foreground = colors.base0E

for _, skeleton in pairs(skeletons) do
	for group, highlights in pairs(skeleton) do
		highlight(group, highlights)
	end
end
