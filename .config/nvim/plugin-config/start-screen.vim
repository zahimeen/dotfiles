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
        \ '    ______                             ____        ______                __    __',
        \ '   / ____/___ ___  ____ ___________   /  _/____   /_  __/________ ______/ /_  / /',
        \ '  / __/ / __ `__ \/ __ `/ ___/ ___/   / // ___/    / / / ___/ __ `/ ___/ __ \/ / ',
        \ ' / /___/ / / / / / /_/ / /__(__  )  _/ /(__  )    / / / /  / /_/ (__  ) / / /_/  ',
        \ '/_____/_/ /_/ /_/\__,_/\___/____/  /___/____/    /_/ /_/   \__,_/____/_/ /_(_)   ',
        \]
