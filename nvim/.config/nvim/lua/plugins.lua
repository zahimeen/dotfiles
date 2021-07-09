local packer = require("packer")
local use = packer.use
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    vim.api.nvim_command("packadd packer.nvim")
end

return packer.startup(function()
    -- Plugins Manager
    use("wbthomason/packer.nvim")

    -- Autocomplete
    use({
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("conf-compe").config()
        end,
    })

    -- Snippets
    use({ "hrsh7th/vim-vsnip", event = "InsertEnter" })
    use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })

    -- File Tree
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("conf-nvimtree").config()
        end,
    })

    -- Theme
    use({
        "siduck76/nvim-base16.lua",
    })

    -- Status Line
    use("glepnir/galaxyline.nvim")

    -- Bufferline
    use({
        "romgrk/barbar.nvim",
        config = function()
            vim.cmd("source $HOME/.config/nvim/lua/conf-barbar/init.vim")
        end,
        event = "BufWinEnter",
    })

    -- Comments
    use({
        event = "BufRead",
        "b3nj5m1n/kommentary",
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        config = [[require('conf-telescope')]],
        cmd = "Telescope",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Dashboard
    use({
        "glepnir/dashboard-nvim",
        event = "BufWinEnter",
        cmd = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks" },
        config = function()
            require("conf-dashboard").config()
        end,
    })

    -- Icons
    use({ "kyazdani42/nvim-web-devicons" })

    -- Keybindings
    use({ "folke/which-key.nvim" })

    -- Indent Guidelines
    -- use {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = "BufRead",
    --     config = function()
    --         require("conf-guidelines").config()
    --     end,
    -- }

    -- LSP
    use({ "neovim/nvim-lspconfig" })
    use({
        "kabouzeid/nvim-lspinstall",
        event = "BufRead",
    })

    -- FTPlugin
    use({ "tjdevries/astronauta.nvim" })

    -- Autopairs
    use({
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("conf-autopairs").config()
        end,
    })

    -- Colorizer
    use({
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("conf-colorizer").config()
        end,
    })

    -- Formatting
    use({
        "lukas-reineke/format.nvim",
    })
end, {
    display = {
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
})
