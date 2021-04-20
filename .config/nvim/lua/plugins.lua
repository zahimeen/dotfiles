local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(
    function(use)

        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"

        -- LSP
        use "neovim/nvim-lspconfig"
        use "glepnir/lspsaga.nvim"
        use "kabouzeid/nvim-lspinstall"

        -- Telescope
        use "nvim-lua/popup.nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-telescope/telescope.nvim"

        -- Debuging
        use "mfussenegger/nvim-dap"

        -- Autocomplete
        use "hrsh7th/nvim-compe"
        use "hrsh7th/vim-vsnip"

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        -- Writing
        use 'junegunn/goyo.vim'
        use { 'vimwiki/vimwiki', branch = "dev" }

        -- Explorer
        use "kyazdani42/nvim-tree.lua"

        use "lewis6991/gitsigns.nvim"
        use "liuchengxu/vim-which-key"
        use "glepnir/dashboard-nvim"
        use "tpope/vim-commentary"
        use "kevinhwang91/nvim-bqf"
        use 'Vimjas/vim-python-pep8-indent'
        use 'voldikss/vim-floaterm'

        -- Color
        use "christianchiarulli/nvcode-color-schemes.vim"

        -- Icons
        use "kyazdani42/nvim-web-devicons"
        use 'ryanoasis/vim-devicons'

        -- Status Line and Bufferline
        use "glepnir/galaxyline.nvim"
        use "romgrk/barbar.nvim"

    end
)
