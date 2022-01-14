local status, lspinstaller = pcall(require, "nvim-lsp-installer")
if not status then
	return
end

local special_servers = {
	"sumneko_lua",
	"jsonls",
	"yamlls",
}

lspinstaller.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	for _, special_server_name in pairs(special_servers) do
		if server.name == special_server_name then
			local special_opts = require("user.lsp.providers." .. server.name)
			opts = vim.tbl_deep_extend("force", special_opts, opts)
		end
	end

	server:setup(opts)
end)
