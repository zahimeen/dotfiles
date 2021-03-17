" Set leader key
let g:mapleader = "\<Space>"

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" Leader BC in general mode will close the buffer
noremap <leader>bc :bdelete<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

" Better window splitting
nnoremap <leader>ws <C-w>s
nnoremap <leader>wv <C-w>v

" HARD MODE!
noremap <Up> :echo "No up for you!"<CR>
noremap <Down> :echo "No down for you!"<CR>
noremap <Left> :echo "No left for you!"<CR>
noremap <Right> :echo "No right for you!"<CR>
