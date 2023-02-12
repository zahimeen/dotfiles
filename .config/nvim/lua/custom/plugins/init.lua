local overrides = require "custom.plugins.overrides"

return {
  -- like allow alpha to happen yknow
  ["goolord/alpha-nvim"] = { disable = false },

  -- tmux panes are w
  ["NvChad/nvterm"] = { disable = true },

  -- woa idk how but hey it works
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- little highlither i think probalby send help
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  -- this is like coles
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  -- i hate tress kill em all
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- u and i are chads
  ["NvChad/ui"] = {
    override_options = overrides.ui,
  },

  -- it just looks good it really like doesnt help me at all
  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = overrides.blankline,
  },

  -- bothering about stuff like this is too much effort
  ["nmac427/guess-indent.nvim"] = {
    config = function()
      require "custom.plugins.indent"
    end,
  },

  -- there is no escape
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- imagine having to format code couldnt be me
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- seamless tmuxination cause like silky smooth
  ["aserowy/tmux.nvim"] = {
    config = function()
      return require("tmux").setup { copy_sync = { false } }
    end,
  },

  -- my config wont work if telescope is lazy loaded
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  -- oh silky smoothy coconut oil thx to ThePrimeagen
  ["ThePrimeagen/harpoon"] = {
    requires = "nvim-lua/plenary.nvim",
  },

  -- zen is pretty cool ngl
  ["folke/zen-mode.nvim"] = {
    cmd = "ZenMode",
    config = function()
      require "custom.plugins.zen"
    end,
  },
}
