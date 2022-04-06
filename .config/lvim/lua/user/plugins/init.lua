require("user.plugins.builtins")

lvim.plugins = {
    { "NvChad/nvim-base16.lua" },
    { "ThePrimeagen/harpoon" },
    {
        "feline-nvim/feline.nvim",
        after = "nvim-web-devicons",
        config = function()
            require("user.plugins.configs.feline")
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("user.plugins.configs.indent-blankline")
        end
    },
}
