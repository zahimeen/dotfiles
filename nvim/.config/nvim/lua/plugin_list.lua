local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    vim.api.nvim_command("packadd packer.nvim")
end

local packer = require("packer")
local use = packer.use

return packer.startup(function()
    -- Plugins Manager
    use("wbthomason/packer.nvim")

    -- Autocomplete
    use({
        "hrsh7th/nvim-compe",
        event = "InsertEnter",
        config = function()
            require("plugins.compe").config()
        end,
    })

    -- Snippets
    use({ "hrsh7th/vim-vsnip", event = "InsertEnter" })
    use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })

    -- File Tree
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("plugins.nvimtree").config()
        end,
    })

    -- Theme
    use({
        "siduck76/nvim-base16.lua",
    })

    -- Status Line
    use({
        "glepnir/galaxyline.nvim",
        config = function()
            require("plugins.galaxyline").config()
        end,
    })

    -- Bufferline
    use({
        "romgrk/barbar.nvim",
        config = function()
            vim.cmd("source $HOME/.config/nvim/vimscript/plugins/barbar.vim")
        end,
        event = "BufWinEnter",
    })

    -- Comments
    use({
        event = "BufRead",
        "tpope/vim-commentary",
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        config = 'require("plugins.telescope")',
        cmd = "Telescope",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("plugins.treesitter").config()
        end,
    })

    -- Dashboard
    use({
        "glepnir/dashboard-nvim",
        event = "BufWinEnter",
        cmd = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks" },
        config = function()
            require("plugins.dashboard").config()
        end,
    })

    -- Icons
    use({ "kyazdani42/nvim-web-devicons" })

    -- Keybindings
    use({
        "folke/which-key.nvim",
        config = function()
            require("plugins.which_key").config()
        end,
    })

    -- Indent Guidelines
    use({
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("plugins.indent_guidelines").config()
        end,
    })

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
            require("plugins.autopairs").config()
        end,
    })

    -- Colorizer
    use({
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("plugins.colorizer").config()
        end,
    })

    -- Zen Mode
    use({
        event = "BufRead",
        cmd = { "TZAtaraxis", "TZMinimalist", "TZFocus" },
        config = function()
            require("plugins.true_zen").config()
        end,
        "Pocco81/TrueZen.nvim",
    })

    -- Format
    use({
        "mhartington/formatter.nvim",
        event = "BufWinEnter",
        config = function()
            require("plugins.formatter").config()
        end,
    })

    -- Git Signs
    use({
        "lewis6991/gitsigns.nvim",

        config = function()
            require("plugins.gitsigns").config()
        end,
        event = "BufRead",
    })
end, {

    display = {
        border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
})
