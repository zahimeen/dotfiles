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
    use 'joshdick/onedark.vim'
    use 'ap/vim-css-color'
    use 'sheerun/vim-polyglot'

    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- Status Line and Bufferline
    use { 'glepnir/galaxyline.nvim', branch = 'main', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use 'romgrk/barbar.nvim'
    
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'

    -- Python
    use 'Vimjas/vim-python-pep8-indent'

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'

    -- Writing
    use 'junegunn/goyo.vim'
    use 'junegunn/limelight.vim'
    use 'vimwiki/vimwiki'

    -- Miscellaneous
    use 'liuchengxu/vista.vim'
    use 'kyazdani42/nvim-tree.lua'
    use 'tpope/vim-commentary'
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
    use 'voldikss/vim-floaterm'
    use 'glepnir/dashboard-nvim'
    use 'liuchengxu/vim-which-key'

end)
