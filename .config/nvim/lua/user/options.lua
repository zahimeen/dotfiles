local o = vim.opt

o.termguicolors = true
o.laststatus = 3
o.showtabline = 0
o.showmode = false
o.showcmd = false
o.fillchars = { eob = " " }
o.shortmess:append "cI"

o.number = true
o.relativenumber = true
o.numberwidth = 4

o.smartindent = true
o.expandtab = false
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

o.hlsearch = true
o.ignorecase = true
o.smartcase = true

o.guicursor = "a:block" -- no more line cursor
o.ruler = false
o.cursorline = true
o.cursorlineopt = "number"
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true

o.timeoutlen = 400
o.updatetime = 100

o.pumheight = 10
--o.pumblend = 10 -- nifty lil thing aint it
o.scrolloff = 8
o.sidescrolloff = 8
o.linebreak = true
o.wrap = false
o.whichwrap:append "<>[]hl"
o.iskeyword:append "-"

o.mouse = "a"
o.clipboard = "unnamedplus" -- see "user.clipboard"
o.undofile = true
o.title = false
o.completeopt = { "menuone", "noselect" }
