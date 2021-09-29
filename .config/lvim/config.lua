lvim.format_on_save = true
lvim.lint_on_save = true
lvim.log.level = "warn"
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.cmp.documentation.border = { " ", " ", " ", " ", " ", " ", " ", " " }
lvim.builtin.lualine.sections.lualine_z = {}

require("user.settings")
require("user.aesthetics")
require("user.keymappings")
require("user.dashboard")
require("user.treesitter")
require("user.nvimtree")
require("user.terminal")
require("user.whichkey")
require("user.extra")
