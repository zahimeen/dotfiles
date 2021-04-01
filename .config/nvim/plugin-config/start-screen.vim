let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'c': '~/.config/qtile/config.py' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ ]

let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_enable_special = 0

let g:startify_custom_header = [
        \ '   _   _  _____  _____  _   _  _____ ___  ___',
        \ '  | \ | ||  ___||  _  || | | ||_   _||  \/  |',
        \ '  |  \| || |__  | | | || | | |  | |  | .  . |',
        \ '  | . ` ||  __| | | | || | | |  | |  | |\/| |',
        \ '  | |\  || |___ \ \_/ /\ \_/ / _| |_ | |  | |',
        \ '  \_| \_/\____/  \___/  \___/  \___/ \_|  |_/'
        \]
