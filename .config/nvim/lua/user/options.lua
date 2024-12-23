local o = vim.opt

o.termguicolors = true
o.laststatus = 3
o.showtabline = 0
o.showmode = false
o.showcmd = false
o.fillchars = { eob = " " }
o.shortmess:append("cI")
o.formatoptions:remove("cro")

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

-- o.guicursor = "a:block" -- no more line cursor
o.ruler = false
o.cursorline = true
o.cursorlineopt = "both"
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
o.whichwrap:append("<>[]hl")
o.iskeyword:append("-")

o.mouse = "a"
o.clipboard = "unnamedplus" -- see "user.clipboard"
o.undofile = true
o.title = false
o.completeopt = { "menuone", "noselect" }

-- yknow the random black screen you get before entering a python file?
-- yea well thats because neovim is looking for the python provider.
-- setting this means it doesnt have to look for it anymore
-- (similar to the cliipboard load time issue)
-- P.S: also make sure you have pynvim
vim.g.python3_host_prog = "/usr/sbin/python3"
