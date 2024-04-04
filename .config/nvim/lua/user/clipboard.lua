-- you probably only have "set clipboard+=unnamedplus" in your config
-- that fucks you over by a couple hundred milliseconds cause it sources
-- /usr/share/nvim/runtime/autoload/provider/clipboard.vim
-- but if you set the global clipboard thing below
-- the clipboard.vim file doesnt have to take 4 years to load

-- BEFORE (nvim --startuptime)
-- 174.310  128.356  128.356: sourcing /usr/share/nvim/runtime/autoload/provider/clipboard.vim

-- AFTER (nvim --startuptime)
-- 046.024  000.130  000.130: sourcing /usr/share/nvim/runtime/autoload/provider/clipboard.vim

if vim.cmd("silent echo has('wsl')") then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			-- CRLF IS AN INVALID COMMAND, IT FUCKED ME OVER FOR AN HOUR
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enable = 0,
	}
end
