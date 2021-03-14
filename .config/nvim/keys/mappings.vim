" Set leader key
let g:mapleader = "\<Space>"

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>
" BS in general mode will close the buffer
noremap <leader>bc :bdelete<CR>

" Run a Python file from inside of Vim
nnoremap <Leader>r :!python %<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^

" HARD MODE!
noremap <Up> :echo "No up for you!"<CR>
noremap <Down> :echo "No down for you!"<CR>
noremap <Left> :echo "No left for you!"<CR>
noremap <Right> :echo "No right for you!"<CR>
