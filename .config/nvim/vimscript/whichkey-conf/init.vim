let g:which_key_timeout = 100

let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map = {
    \ 'l' : [':Limelight!!1.0<CR>'  ,'Toggle Limelight'],
    \ }

let g:which_key_map.b =  {
    \ 'name' : 'Buffer',
    \ 'n' : ['<cmd>BufferNext<CR>'   ,'Switch Next Buffer'],
    \ 'p' : ['<cmd>BufferPrev<CR>'   ,'Switch Previous Buffer'],
    \ 'd' : ['<cmd>BufferDelete<CR>' ,'Delete Buffer'],
    \ }

let g:which_key_map.f = {
    \ 'name' : 'Floaterm',
    \ 'n' : ['FloatermNew'  ,'Blank Floaterm'],
    \ 'r' : ['FloaterNew ranger'    ,'Ranger Floaterm'],
    \ 'p' : ['FloatermNew python %' ,'Run Python File'],
    \ }

let g:which_key_map.g = {
    \ 'name' : 'Git Fugitive and Goyo',
    \ 's' : ['<cmd>Gstatus<CR>' ,'Git Status'],
    \ 'c' : ['<cmd>Gcommit<CR>' ,'Git Commit'],
    \ 'p' : ['<cmd>Gpush<CR>'   ,'Git Push'],
    \ 'n' : ['<cmd>Goyo | set wrap linebreak<CR>'   ,'Goyo On'],
    \ 'f' : ['<cmd>Goyo | set nowrap nolinebreak<CR>'  ,'Goyo Off'],
    \ }

let g:which_key_map.r = {
    \ 'name' : 'Window Resizing',
    \ 'h' : ['<cmd>vertical resize +5<CR>'     ,'Increase Vertical Length'],
    \ 'j' : ['<cmd>resize -5<CR>'     ,'Decrease Horizontal Length'],
    \ 'k' : ['<cmd>resize +5<CR>'     ,'Increase Horizontal Length'],
    \ 'l' : ['<cmd>vertical resize -5<CR>'     ,'Decrease Vertical Length'],
    \ }

let g:which_key_map.v = {
    \ 'name' : 'Vista',
    \ 'o' : ['<cmd>Vista<CR>'    ,'Open Vista'],
    \ 'c' : ['<cmd>Vista!<CR>'   ,'Close Vista'],
    \ }

let g:which_key_map.w = {
    \ 'name' : 'Window Movement and Creation',
    \ 'h' : ['<C-w>h'     ,'Switch Focus To Left'],
    \ 'j' : ['<C-w>j'     ,'Switch Focus To Bottom'],
    \ 'k' : ['<C-w>k'     ,'Switch Focus To Up'],
    \ 'l' : ['<C-w>l'     ,'Switch Focus To Right'],
    \ 's' : ['<C-w>s'     ,'Create Split Window'],
    \ 'v' : ['<C-w>v'     ,'Create Vertical Split Window'],
    \ }

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>

