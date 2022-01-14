local status_telescope, telescope = pcall(require, "telescope")
local status_actions, actions = pcall(require, "telescope.actions")
if not (status_telescope and status_actions) then
	return
end

telescope.load_extension("project")

local config = {
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		mappings = {
			i = {
				["<Esc>"] = actions.close,

				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-j>"] = actions.results_scrolling_up,
				["<C-k>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.move_selection_next,
				["<S-Tab>"] = actions.move_selection_previous,
			},
		},
	},
	pickers = {
		find_files = {
            theme = "dropdown",
            previewer = false,
			find_command = { "fd", "--type=file", "--ignore-case" },
		},
        project = {
            theme = "dropdown",
            previewer = false,
        },
        oldfiles= {
            theme = "dropdown",
            previewer = false,
        },
		live_grep = {
            theme = "dropdown",
            previewer = false,
			only_sort_text = true,
		},
	},
}

telescope.setup(config)
