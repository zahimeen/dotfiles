local telescope = lvim.builtin.telescope
local actions = require("telescope.actions")

telescope.defaults.layout_config.horizontal.prompt_position = "top"
telescope.defaults.path_display = { "truncate" }
telescope.defaults.prompt_prefix = "   "
telescope.defaults.selection_caret = "  "
telescope.defaults.entry_prefix = "  "
telescope.defaults.sorting_strategy = "ascending"
telescope.defaults.layout_strategy = "horizontal"
telescope.defaults.mappings = {
    i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default + actions.center,
    },
    n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Tab>"] = actions.move_selection_next,
        ["<S-Tab>"] = actions.move_selection_previous,
        ["q"] = actions.close,
        ["<ESC>"] = actions.close,
    },
}
