local options = vim.opt
local settings = {
    cc = "80",
    rnu = true,
    sw = 4,
    fillchars = { eob = " " },
}

for option, setting in pairs(settings) do
    options[option] = setting
end
