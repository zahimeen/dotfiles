hi Comment cterm=italic
let g:nvcode_termcolors=256

syntax on
" colorscheme nord
" colorscheme nvcode
colorscheme onedark
" colorscheme TSnazzy
" colorscheme aurora

" 80 Line Column 
set colorcolumn=80
" Side Column
set signcolumn=yes

" AirlineTheme
let g:airline_theme = 'onedark'

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
