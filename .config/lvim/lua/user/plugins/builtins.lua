--[[

User configurations for plugins already installed and configured by LunarVim.

--]]

local builtins = lvim.builtin

require("user.plugins.configs.alpha")
require("user.plugins.configs.bufferline")
require("user.plugins.configs.nvimtree")
require("user.plugins.configs.telescope")
require("user.plugins.configs.toggleterm")
require("user.plugins.configs.treesitter")
require("user.plugins.configs.which-key")

builtins.lualine.active = false

-- dapz

builtins.dap.active = true
