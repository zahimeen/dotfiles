" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')
 
    " Themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'christianchiarulli/nvcode-color-schemes.vim'
    Plug 'nvim-treesitter/nvim-treesitter'
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " File Navigation
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim' 
    " File Tree
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    " Git
    Plug 'tpope/vim-fugitive'
    " Autocomplete
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Notetaking
    Plug 'vimwiki/vimwiki'
    " Nice Commenting
    Plug 'tpope/vim-commentary'

call plug#end()
