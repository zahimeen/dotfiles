return function(group, highlights)
	local parts = { group }
	local guifg = highlights[1]
	local guibg = highlights[2]
	local attr = highlights[3]
	local guisp = highlights[4]
	if guifg then
		table.insert(parts, "guifg=" .. guifg)
	end
	if guibg then
		table.insert(parts, "guibg=" .. guibg)
	end
	if attr then
		table.insert(parts, "gui=" .. attr)
	end
	if guisp then
		table.insert(parts, "guisp=" .. guisp)
	end

	vim.api.nvim_command("highlight " .. table.concat(parts, " "))
end
