local status, lspconfig = pcall(require, "lspconfig")
if not status then
	return
end

require("user.lsp.installer")
require("user.lsp.handlers").setup()
