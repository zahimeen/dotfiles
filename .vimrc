syntax on

set hidden
set encoding=utf-8
set clipboard+=unnamedplus
set nobackup
set nowritebackup
set shortmess+=c

set nohlsearch
set incsearch

set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap

set number
set relativenumber
set signcolumn="yes"

set scrolloff=8
set sidescrolloff=8

nnoremap <tab> <cmd>bnext<cr>
nnoremap <s-tab> <cmd>bprevious<cr>
nnoremap <s-x> <cmd>bdelete<cr>
vnoremap < <gv
vnoremap > >gv
