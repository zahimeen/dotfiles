local config = {
    indentLine_enabled = 1,
    char = "▏",
    filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvchad_cheatsheet",
        "lsp-installer",
        "",
    },
    buftype_exclude = { "terminal", "NvimTree" },
    show_trailing_blankline_indent = true,
    show_first_indent_level = true,
}

require("indent_blankline").setup(config)
