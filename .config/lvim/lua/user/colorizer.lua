local colorizer_config = {
    RGB = true,
    RRGGBB = true,
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
}

require("colorizer").setup({ "*" }, colorizer_config)
