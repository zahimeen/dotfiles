local status, colorizer = pcall(require, "colorizer")
if not status then
	return
end

local colorizer_settings = {
	RGB = true,
	RRGGBB = true,
	RRGGBBAA = true,
	rgb_fn = true,
	hsl_fn = true,
	css = true,
	css_fn = true,
}

colorizer.setup({ "*" }, colorizer_settings)
