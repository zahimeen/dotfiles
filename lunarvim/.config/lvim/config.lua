lvim.format_on_save = true
lvim.lint_on_save = true

lvim.colorscheme = "onedark"
vim.g.onedark_style = "darker"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "80"
vim.opt.timeoutlen = 200
vim.opt.hlsearch = false

lvim.builtin.treesitter.autotag = true
lvim.builtin.treesitter.ensure_installed = {
	"python",
	"javascript",
	"typescript",
	"html",
	"css",
	"json",
	"yaml",
	"go",
	"toml",
}

lvim.builtin.galaxyline.active = false

lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.document_highlight = false

require("user.dashboard")
require("user.keymappings")
require("user.plugins")
