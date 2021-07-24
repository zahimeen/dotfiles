O.colorscheme = "spacegray"
O.format_on_save = true

--- HELPERS ---

local setting = O.default_options
local lang = O.lang
local plugin = O.plugin

--- SETTINGS ---

setting.tabstop = 4
setting.shiftwidth = 4
setting.scrolloff = 8
setting.sidescrolloff = 8
setting.guifont = "JetBrainsMonoMedium Nerd Font"
setting.relativenumber = true
setting.wrap = false
setting.laststatus = 2
setting.colorcolumn = "80"

--- LANGUAGE ---

lang.tsserver.formatter.exe = "prettier"
lang.tsserver.autoformat = true

lang.lua.formatter.exe = "lua-format"
lang.lua.formatter.args = { "-c $HOME/.config/lua-format/config" }
lang.lua.formatter.stdin = true

--- PLUGINS ---

plugin.dashboard.active = true
plugin.dashboard.custom_header = {
    "██╗   ██╗██╗███╗   ███╗",
    "██║   ██║██║████╗ ████║",
    "██║   ██║██║██╔████╔██║",
    "╚██╗ ██╔╝██║██║╚██╔╝██║",
    " ╚████╔╝ ██║██║ ╚═╝ ██║",
    "  ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

plugin.terminal.active = true
plugin.terminal.direction = "vertical"
plugin.terminal.shading_factor = 1

plugin.zen.active = false
plugin.zen.window.height = 0.95
plugin.zen.window.width = 0.8

O.treesitter.highlight.enabled = true
O.treesitter.ensure_installed = "maintained"
O.treesitter.ignore_install = { "php" }

O.user_plugins = {
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = {
                    "<C-u>",
                    "<C-d>",
                    "<C-b>",
                    "<C-f>",
                    "<C-y>",
                    "<C-e>",
                    "zt",
                    "zz",
                    "zb",
                },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = false, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
            })
        end
,
    },
    { "kevinhwang91/nvim-bqf", event = "BufRead" },
    {
        event = "BufRead",
        cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
        config = function()
            require("true-zen").setup({
                ui = {
                    bottom = {
                        laststatus = 0,
                        ruler = false,
                        showmode = false,
                        showcmd = false,
                        cmdheight = 1,
                    },
                    top = { showtabline = 0 },
                    left = {
                        number = false,
                        relativenumber = false,
                        signcolumn = "no",
                    },
                },
                modes = {
                    ataraxis = {
                        left_padding = 20,
                        right_padding = 20,
                        top_padding = 1,
                        bottom_padding = 1,
                        ideal_writing_area_width = { 0 },
                        just_do_it_for_me = false,
                        keep_default_fold_fillchars = true,
                        custome_bg = "",
                        bg_configuration = true,
                        affected_higroups = {
                            NonText = {},
                            FoldColumn = {},
                            ColorColumn = {},
                            VertSplit = {},
                            StatusLine = {},
                            StatusLineNC = {},
                            SignColumn = {},
                        },
                    },
                    focus = { margin_of_error = 5,
                              focus_method = "experimental" },
                },
                integrations = {
                    vim_gitgutter = false,
                    galaxyline = true,
                    tmux = false,
                    gitsigns = true,
                    nvim_bufferline = false,
                    limelight = false,
                    vim_airline = false,
                    vim_powerline = false,
                    vim_signify = false,
                    express_line = false,
                    lualine = false,
                },
                misc = {
                    on_off_commands = false,
                    ui_elements_commands = false,
                    cursor_by_mode = false,
                },
            })
        end
,
        "Pocco81/TrueZen.nvim",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            vim.g.indentLine_enabled = 1
            vim.g.indent_blankline_char = "▏"

            vim.g.indent_blankline_filetype_exclude = {
                "help",
                "terminal",
                "dashboard",
            }
            vim.g.indent_blankline_buftype_exclude = { "terminal" }

            vim.g.indent_blankline_show_trailing_blankline_indent = true
            vim.g.indent_blankline_show_first_indent_level = true
            vim.g.indent_blankline_show_current_context = false
            vim.g.indent_blankline_use_treesitter = false
        end
,
    },
}
