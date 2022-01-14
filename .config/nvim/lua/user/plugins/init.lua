local plugins = require("user.plugins.plugins")
local status, _ = pcall(require, "packer")
if not status then
	require("user.plugins.bootstrap")
	vim.cmd("packadd packer.nvim")
end

local packer = require("packer")

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "solid" })
		end,
	},
})

packer.startup(function(use)
	for _, plugin in pairs(plugins) do
		use(plugin)
	end

	if not status then
		packer.sync()
	end
end)
