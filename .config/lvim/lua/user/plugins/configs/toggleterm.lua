local toggleterm = lvim.builtin.terminal

toggleterm.active = true
toggleterm.direction = "float"
toggleterm.float_opts.border = "curved"
toggleterm.open_mapping = "<C-t>"
toggleterm.float_opts.highlights = {
    background = "ToggleTermNormal",
    border = "ToggleTermBorder",
}
