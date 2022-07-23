local cmd = vim.cmd
local theme = lvim.colorscheme
local base16 = require("base16")
local base16_colors = require("themes.tomorrow-night-base16")
local colors = require("hl_themes." .. theme)

local function hl_fg(group, col)
	cmd("hi " .. group .. " guifg=" .. col)
end

local function hl_bg(group, col)
	cmd("hi " .. group .. " guibg=" .. col)
end

local function hl_fg_bg(group, fgcol, bgcol)
	cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local one_bg3 = colors.one_bg3
local folder_bg = colors.folder_bg
local pmenu_bg = colors.pmenu_bg
local line = colors.line
local black = colors.black
local black2 = colors.black2
local darker_black = colors.darker_black
local blue = colors.blue
local green = colors.green
local grey = colors.grey
local grey_fg = colors.grey_fg
local light_grey = colors.light_grey
local nord_blue = colors.nord_blue
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
-- local orange = colors.orange

base16(base16.themes(theme), true)

cmd("hi clear CursorLine")

hl_fg("Comment", grey_fg .. " gui=italic")
hl_fg("CursorLineNr", white)
hl_bg("NormalFloat", darker_black)
hl_fg("FloatBorder", blue)

hl_bg("Pmenu", one_bg)
hl_bg("PmenuSbar", one_bg2)
hl_bg("PmenuSel", pmenu_bg)
hl_bg("PmenuThumb", nord_blue)
hl_fg("CmpItemAbbr", white)
hl_fg("CmpItemAbbrMatch", white)
hl_fg("CmpItemKind", white)
hl_fg("CmpItemMenu", white)

hl_fg("StatusLineNC", one_bg3 .. " gui=underline")

hl_fg("LineNr", grey)
hl_fg("NvimInternalError", red)
hl_fg("VertSplit", one_bg2)

hl_fg("AlphaHeader", grey_fg)
hl_fg("AlphaButton", light_grey)
hl_fg("AlphaFooter", nord_blue)
hl_fg("AlphaShortcut", "#" .. base16_colors.base0E)

hl_fg_bg("DiffAdd", blue, "NONE")
hl_fg_bg("DiffChange", grey_fg, "NONE")
hl_fg_bg("DiffChangeDelete", red, "NONE")
hl_fg_bg("DiffModified", red, "NONE")
hl_fg_bg("DiffDelete", red, "NONE")

hl_fg("IndentBlanklineChar", line)
hl_fg("IndentBlanklineSpaceChar", line)

hl_fg("DiagnosticHint", purple)
hl_fg("DiagnosticError", red)
hl_fg("DiagnosticWarn", yellow)
hl_fg("DiagnosticInformation", green)

hl_fg("NvimTreeEmptyFolderName", folder_bg)
hl_fg("NvimTreeEndOfBuffer", darker_black)
hl_fg("NvimTreeFolderIcon", folder_bg)
hl_fg("NvimTreeFolderName", folder_bg)
hl_fg("NvimTreeGitDirty", red)
hl_fg("NvimTreeIndentMarker", one_bg2)
hl_bg("NvimTreeNormal", darker_black)
hl_bg("NvimTreeNormalNC", darker_black)
hl_fg("NvimTreeOpenedFolderName", folder_bg)
hl_fg("NvimTreeRootFolder", red)
hl_fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
hl_fg_bg("NvimTreeVertSplit", darker_black, darker_black)
hl_fg_bg("NvimTreeWindowPicker", red, black2)

hl_bg("TelescopeNormal", darker_black)
hl_bg("TelescopeSelection", black2)
hl_fg_bg("TelescopeBorder", darker_black, darker_black)
hl_fg_bg("TelescopePromptBorder", black2, black2)
hl_fg_bg("TelescopePromptNormal", white, black2)
hl_fg_bg("TelescopePromptPrefix", red, black2)
hl_fg_bg("TelescopePreviewTitle", black, green)
hl_fg_bg("TelescopePromptTitle", black, red)
hl_fg_bg("TelescopeResultsTitle", darker_black, darker_black)

hl_bg("ToggleTermNormal", black2)
hl_fg_bg("ToggleTermBorder", black2, black2)

hl_bg("HarpoonWindow", darker_black)
hl_fg_bg("HarpoonBorder", darker_black, darker_black)
