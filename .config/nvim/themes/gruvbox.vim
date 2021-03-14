hi Comment cterm=italic

let g:theprimeagen_colorscheme = "gruvbox"

let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox

highlight Normal guibg=none
highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

set colorcolumn=80

" AirlineTheme
let g:airline_theme = 'gruvbox'
