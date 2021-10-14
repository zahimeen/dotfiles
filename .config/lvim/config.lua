-- general
lvim.colorscheme = "onedarker"
lvim.format_on_save = true

-- options
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- keybindings
lvim.leader = "space"

-- language
lvim.lang.lua.formatters = { { exe = "stylua" } }

-- pre-installed plugins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.autotag.enabled = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- personal plugins
lvim.plugins = {
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
