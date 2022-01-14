local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

local treesitter_config = {
	ensure_installed = "maintained",
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = false,
		disable = { "python" },
	},
}

treesitter.setup(treesitter_config)
