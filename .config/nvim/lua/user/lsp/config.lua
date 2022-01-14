return {
	virtual_text = false,
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	signs = {
		active = true,
		values = {
			{ name = "DiagnosticSignError", text = "" },
			{ name = "DiagnosticSignWarn", text = "" },
			{ name = "DiagnosticSignHint", text = "" },
			{ name = "DiagnosticSignInfo", text = "" },
		},
	},
	float = {
		focusable = false,
		style = "minimal",
		border = "solid",
		source = "always",
		header = "",
		prefix = "",
	},
}
