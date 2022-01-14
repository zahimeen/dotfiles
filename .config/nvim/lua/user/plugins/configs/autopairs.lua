local status, npairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		typescript = { "string", "template_string" },
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
})

local status_cmp_npairs, cmp_npairs = pcall(require, "nvim-autopairs.completion.cmp")
local status_cmp, cmp = pcall(require, "cmp")
if not (status_cmp_npairs and status_cmp) then
	return
end

cmp.event:on("confirm_done", cmp_npairs.on_confirm_done({ map_char = { tex = "" } }))
