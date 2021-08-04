lvim.builtin.dashboard = {
	active = true,
	custom_header = {
		"██╗     ██╗   ██╗███╗   ██╗ █████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
		"██║     ██║   ██║████╗  ██║██╔══██╗██╔══██╗██║   ██║██║████╗ ████║",
		"██║     ██║   ██║██╔██╗ ██║███████║██████╔╝██║   ██║██║██╔████╔██║",
		"██║     ██║   ██║██║╚██╗██║██╔══██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║",
		"███████╗╚██████╔╝██║ ╚████║██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
		"╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
	},
	custom_section = {
		a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
		b = { description = { "  Recents                   SPC f r" }, command = "Telescope oldfiles" },
		c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
		d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
		f = { description = { "  Load Last Session         SPC s l" }, command = "SessionLoad" },
	},
	custom_footer = {
		"  VSCode Is Slower Than A Snale!",
	},
}
