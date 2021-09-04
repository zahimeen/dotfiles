lvim.plugins = {
    {
        "norcalli/nvim-colorizer.lua",
            config = function()
                require("user.colorizer").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        setup = function()
            require("user.blankline").setup()
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },
    {
        "turbio/bracey.vim",
        cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
        run = "npm install --prefix server",
    },
    {
        "monaqa/dial.nvim",
        event = "BufRead",
        config = function()
            require("user.dial").setup()
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        config = function()
            require("user.autotag").setup()
        end,
    },
    {
        "metakirby5/codi.vim",
        cmd = "Codi",
    },
    {
        "KabbAmine/vCoolor.vim",
        event = "BufRead",
    },
}
