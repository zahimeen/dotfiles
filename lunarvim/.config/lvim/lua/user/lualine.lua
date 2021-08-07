local M = {}

local function get_attached_provider_name(msg)
	msg = msg or "LSP Inactive"
	local buf_clients = vim.lsp.buf_get_clients()
	local utils = require("utils")
	if next(buf_clients) == nil then
		return msg
	end
	local buf_ft = vim.bo.filetype
	local buf_client_names = {}
	local null_ls_providers = require("lsp.null-ls").get_registered_providers_by_filetype(buf_ft)
	for _, client in pairs(buf_clients) do
		if client.name ~= "null-ls" then
			table.insert(buf_client_names, client.name)
		end
	end
	vim.list_extend(buf_client_names, null_ls_providers)
	return "  " .. tostring(buf_client_names[1])
end

local lualine_config = {
	enabled = true,
	options = {
		theme = "custom_onedark",
		disabled_filetypes = {
			"NvimTree",
		},
	},
	sections = {
		lualine_a = {
			{ "mode", lower = false },
		},
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { get_attached_provider_name },
	},
	extensions = {
		"quickfix",
	},
}

M.setup = function()
	local exists, lualine = pcall(require, "lualine")
	if not exists then
		print("There is a problem with lualine!")
		return
	end

	lualine.setup(lualine_config)
end

return M
