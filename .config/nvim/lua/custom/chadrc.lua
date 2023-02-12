local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = { "catppuccin", "tomorrow_night" },
  theme = "catppuccin",
  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
