" Auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/autoload/plugged')

    " Theme
    Plug 'gruvbox-community/gruvbox'

    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Fuzzy Finding
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Nice Commenting
    Plug 'tpope/vim-commentary'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    
    " Colour
    Plug 'ap/vim-css-color'

    " CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Startup
    Plug 'mhinz/vim-startify'

    " Notetaking
    Plug 'vimwiki/vimwiki'

call plug#end()
