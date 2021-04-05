local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function()

    -- Packer
    use 'wbthomason/packer.nvim'

    -- Color
    use { 'christianchiarulli/nvcode-color-schemes.vim', requires = { 'nvim-treesitter/nvim-treesitter' } }
    use 'vim-python/python-syntax'
    use 'ap/vim-css-color'
    use 'euclidianAce/BetterLua.vim'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status Line and Bufferline
    use { 'glepnir/galaxyline.nvim', branch = 'main', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use 'romgrk/barbar.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'kabouzeid/nvim-lspinstall'

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- Writing
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use 'vimwiki/vimwiki'

    -- Miscellaneous
    use 'kyazdani42/nvim-tree.lua'
    use 'tpope/vim-commentary'
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
    use 'mhinz/vim-startify'
    use 'glepnir/dashboard-nvim'
    use 'voldikss/vim-floaterm'

end)
