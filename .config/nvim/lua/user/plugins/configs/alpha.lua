local status, alpha = pcall(require, "alpha")
if not status then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
	dashboard.button("SPC f e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("SPC f f", "  Find file", ":Telescope find_files<CR>"),
	dashboard.button("SPC f p", "  Find project", ":Telescope project<CR>"),
	dashboard.button("SPC f r", "  Recently used files", ":Telescope oldfiles<CR>"),
	dashboard.button("SPC f t", "  Find text", ":Telescope live_grep<CR>"),
	dashboard.button("SPC   q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = "www.instagram.com/zahimeen"
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
