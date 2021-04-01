let g:mapleader = "\<Space>"

nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
noremap <leader>bc :bdelete<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v

nnoremap <leader>mw :set wrap linebreak<CR>
nnoremap <leader>mwo :set nowrap nolinebreak<CR>

noremap <Up> :echo "No up for you!"<CR>
noremap <Down> :echo "No down for you!"<CR>
noremap <Left> :echo "No left for you!"<CR>
noremap <Right> :echo "No right for you!"<CR>
