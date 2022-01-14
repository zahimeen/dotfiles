local skeleton_names = { "neovim", "syntax", "git", "lsp", "barbar", "nvimtree" }

local skeletons = {}

for _, skeleton_name in pairs(skeleton_names) do
	local skeleton = require("colorscheme.skeletons." .. skeleton_name)
	table.insert(skeletons, skeleton)
end

return skeletons
