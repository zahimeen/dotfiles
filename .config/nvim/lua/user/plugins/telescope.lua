local M = {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependences = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
}

M.config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			prompt_prefix = "  ",
			selection_caret = "  ",
			multi_icon = " + ",
			entry_prefix = "  ",
			initial_mode = "insert",
			mappings = { i = { ["<Esc>"] = "close" } },
			sorting_strategy = "ascending",
			layout_strategy = "horizontal",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.6,
					results_width = 0.4,
				},
				vertical = {
					mirror = false,
				},
				width = 0.85,
				height = 0.75,
				preview_cutoff = 120,
			},
		},
		pickers = {
			planets = { show_pluto = true, show_moon = true },
			colorscheme = { enable_preview = true },
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	})

	telescope.load_extension("fzf")

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader><space>", builtin.find_files)
	vim.keymap.set("n", "<leader>ff", builtin.find_files)
	vim.keymap.set("n", "<leader>fg", builtin.live_grep)
	vim.keymap.set("n", "<leader>fb", builtin.buffers)
	vim.keymap.set("n", "<leader>fh", builtin.help_tags)
	vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
	vim.keymap.set("n", "<leader>ft", builtin.builtin)
end

return M
