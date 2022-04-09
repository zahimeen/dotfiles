local exists, blankline = pcall(require, "indent_blankline")
if not exists then
    return
end

local config = {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
        "",
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvchad_cheatsheet",
        "lsp-installer",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
}

blankline.setup(config)
