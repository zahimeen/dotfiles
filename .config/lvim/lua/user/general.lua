local lvim = lvim

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
    { command = "yapf", filetypes = { "python" } },
    { command = "stylua", filetypes = { "lua" } },
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({})

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tomorrow-night"
