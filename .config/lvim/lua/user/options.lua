local options, global = vim.opt, vim.g
local settings = {
    cc = "80",
    ch = 1,
    rnu = true,
    sw = 4,
    fillchars = { eob = " " },
}

for option, setting in pairs(settings) do
    options[option] = setting
end

for _, plugin in pairs({
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
}) do
   global["loaded_" .. plugin] = 1
end
