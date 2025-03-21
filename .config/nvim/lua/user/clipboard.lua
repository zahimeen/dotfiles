-- you probably only have "set clipboard+=unnamedplus" in your config
-- that adds about a couple hundred milliseconds cause it sources
-- /usr/share/nvim/runtime/autoload/provider/clipboard.vim
-- but if you set the global clipboard as below,
-- clipboard.vim doesnt have to do its highly unoptimised checking
-- (results may vary)

-- BEFORE (nvim --startuptime)
-- 174.310  128.356  128.356: sourcing $VIMRUNTIME/autoload/provider/clipboard.vim

-- AFTER  (nvim --startuptime)
-- 046.024  000.130  000.130: sourcing $VIMRUNTIME/autoload/provider/clipboard.vim

if vim.fn.has("wsl") then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enable = 0,
	}
end
