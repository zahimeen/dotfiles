--[[

Configurations for plugins already installed and configured by LunarVim.

--]]

local lvim = lvim

lvim.builtin.lualine.active = false

lvim.builtin.notify.active = true

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.alpha.dashboard.section.header.opts.hl = "AlphaHeader"
lvim.builtin.alpha.dashboard.section.footer.opts.hl = "AlphaFooter"
local resolve_buttons = function()
    local dashboard = require("alpha.themes.dashboard")
    local buttons = {}

    for _, entry in pairs(lvim.builtin.alpha.dashboard.section.buttons.entries) do
        local on_press = function()
            local sc_ = entry[1]:gsub("%s", ""):gsub("SPC", "<leader>")
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end

        local button_element = dashboard.button(entry[1], entry[2], entry[3])
        button_element.on_press = on_press
        button_element.opts.hl = "AlphaButtons"

        table.insert(buttons, button_element)
    end

    return buttons
end
lvim.builtin.alpha.dashboard.section.buttons.entries = {
    { "SPC f f", "  Find Files", "<cmd>Telescope find_files<cr>" },
    { "SPC f p", "  Find Projects", "<cmd>Telescope projects<cr>" },
    { "SPC f r", "  Find Recent Files", "<cmd>Telescope oldfiles<cr>" },
    { "SPC f w", "  Find Text", "<cmd>Telescope live_grep<cr>" },
    {
        "SPC l c",
        "  Edit Configuration",
        "<cmd>edit " .. require("lvim.config").get_user_config_path() .. "<cr>",
    },
}
lvim.builtin.alpha.dashboard.section.buttons.val = resolve_buttons()
lvim.builtin.alpha.dashboard.section.header.val = {
    "                                                               ▄▄                    ",
    " ▀████▀                                         ▀████▀   ▀███▀ ██                    ",
    "   ██                                             ▀██     ▄█                         ",
    "   ██     ▀███  ▀███ ▀████████▄  ▄█▀██▄ ▀███▄███   ██▄   ▄█  ▀███ ▀████████▄█████▄   ",
    "   ██       ██    ██   ██    ██ ██   ██   ██▀ ▀▀    ██▄  █▀    ██   ██    ██    ██   ",
    "   █▓     ▄ ▓█    ██   █▓    ██  ▄███▓█   █▓        ▀▓█ ▓▀     ▓█   ▓█    ██    ██   ",
    "   █▓    ▒█ ▓█    █▓   █▓    ▓█ █▓   ▓█   █▓         ▓██▄      ▓█   ▓█    ▓█    ██   ",
    "   ▓▓     ▓ ▓█    ▓▓   ▓▓    ▓▓  ▓▓▓▓▒▓   ▓▓         ▓▓ ▓▀     ▓▓   ▓▓    ▓▓    ▓▓   ",
    "   ▓▒    ▓▓ ▓▓    ▓▓   ▓▓    ▓▓ ▓▓   ▒▓   ▓▒         ▓▓▒▒      ▓▓   ▒▓    ▒▓    ▓▓   ",
    " ▒▓▒▒▓▓▒▓▒  ▒▒▓▓▒▓▒▓▒▒ ▒▒▒  ▒▓▒ ▒▓▒ ▒ ▓▒▒ ▒▒▒         ▒      ▒▓▒▓▒▒ ▒▓▒  ▒▒▒   ▒▒▓▒  ",
}

lvim.builtin.terminal.active = true

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.additional_vim_regex_highlighting = false

lvim.builtin.which_key.setup.window.border = "shadow"
lvim.builtin.which_key.setup.window.padding = { 3, 3, 3, 3}
lvim.builtin.which_key.setup.window.margin = { 0, 10, 3, 10 }
lvim.builtin.which_key.setup.layout.spacing = 6

lvim.builtin.telescope.defaults.layout_config.horizontal.prompt_position = "top"
lvim.builtin.telescope.defaults.path_display = { "truncate" }
lvim.builtin.telescope.defaults.prompt_prefix = "   "
lvim.builtin.telescope.defaults.selection_caret = "  "
lvim.builtin.telescope.defaults.entry_prefix = "  "
lvim.builtin.telescope.defaults.sorting_strategy = "ascending"
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
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

lvim.builtin.terminal.direction = "float"
lvim.builtin.terminal.float_opts.border = "curved"
lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.float_opts.highlights = {
    background = "ToggleTermNormal",
    border = "ToggleTermBorder",
}

local default = {
    colors =  require("hl_themes." .. lvim.colorscheme),
}
default = {
   options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false,
      custom_filter = function(buf_number)
         -- Func to filter out our managed/persistent split terms
         local present_type, type = pcall(function()
            return vim.api.nvim_buf_get_var(buf_number, "term_type")
         end)

         if present_type then
            if type == "vert" then
               return false
            elseif type == "hori" then
               return false
            end
            return true
         end

         return true
      end,
   },

   highlights = {
      background = {
         guifg = default.colors.grey_fg,
         guibg = default.colors.black2,
      },

      -- buffers
      buffer_selected = {
         guifg = default.colors.white,
         guibg = default.colors.black,
         gui = "bold",
      },
      buffer_visible = {
         guifg = default.colors.light_grey,
         guibg = default.colors.black2,
      },

      -- for diagnostics = "nvim_lsp"
      error = {
         guifg = default.colors.light_grey,
         guibg = default.colors.black2,
      },
      error_diagnostic = {
         guifg = default.colors.light_grey,
         guibg = default.colors.black2,
      },

      -- close buttons
      close_button = {
         guifg = default.colors.light_grey,
         guibg = default.colors.black2,
      },
      close_button_visible = {
         guifg = default.colors.light_grey,
         guibg = default.colors.black2,
      },
      close_button_selected = {
         guifg = default.colors.red,
         guibg = default.colors.black,
      },
      fill = {
         guifg = default.colors.grey_fg,
         guibg = default.colors.black2,
      },
      indicator_selected = {
         guifg = default.colors.black,
         guibg = default.colors.black,
      },

      -- modified
      modified = {
         guifg = default.colors.red,
         guibg = default.colors.black2,
      },
      modified_visible = {
         guifg = default.colors.red,
         guibg = default.colors.black2,
      },
      modified_selected = {
         guifg = default.colors.green,
         guibg = default.colors.black,
      },

      -- separators
      separator = {
         guifg = default.colors.black2,
         guibg = default.colors.black2,
      },
      separator_visible = {
         guifg = default.colors.black2,
         guibg = default.colors.black2,
      },
      separator_selected = {
         guifg = default.colors.black2,
         guibg = default.colors.black2,
      },

      -- tabs
      tab = {
         guifg = default.colors.light_grey,
         guibg = default.colors.one_bg3,
      },
      tab_selected = {
         guifg = default.colors.black2,
         guibg = default.colors.nord_blue,
      },
      tab_close = {
         guifg = default.colors.red,
         guibg = default.colors.black,
      },
   },
}

lvim.builtin.bufferline = default
lvim.builtin.bufferline.active = true
