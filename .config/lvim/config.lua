-- general
lvim.format_on_save = true

-- colorscheme
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"

-- options
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.colorcolumn = "80"

-- keybindings
lvim.leader = "space"

-- pre-installed plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enabled = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_root_folder = 1
lvim.builtin.which_key.setup.window.border = "shadow"
lvim.builtin.which_key.setup.window.margin = { 0, 4, 2, 4 }
lvim.builtin.lualine.sections.lualine_z = {}

-- personal plugins
lvim.plugins = {
    {
        "zahimeen/tokyonight.nvim",
    },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("user.colorizer")
        end,
    },
}
