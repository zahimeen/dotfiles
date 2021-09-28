lvim.builtin.dashboard.active = true
lvim.builtin.dashboard.custom_footer = { "  VSCode Is Slower Than A Snale!" }
lvim.builtin.dashboard.custom_section.g = { description = { "  Load Last Session  " }, command = "SessionLoad" }
lvim.builtin.dashboard.custom_header = {
	"██╗     ██╗   ██╗███╗   ██╗ █████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"██║     ██║   ██║████╗  ██║██╔══██╗██╔══██╗██║   ██║██║████╗ ████║",
	"██║     ██║   ██║██╔██╗ ██║███████║██████╔╝██║   ██║██║██╔████╔██║",
	"██║     ██║   ██║██║╚██╗██║██╔══██║██╔══██╗╚██╗ ██╔╝██║██║╚██╔╝██║",
	"███████╗╚██████╔╝██║ ╚████║██║  ██║██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

require("core.autocmds").define_augroups({
	_mydashboard = {
		{
			"FileType",
			"dashboard",
			"setlocal laststatus=0"
		},
	}
})
