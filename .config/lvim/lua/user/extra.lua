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
}
