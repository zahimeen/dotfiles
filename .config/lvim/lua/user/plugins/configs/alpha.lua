local alpha = lvim.builtin.alpha
local if_nil = vim.F.if_nil
local align_center = require("lvim.interface.text").align_center

local header = {
    type = "text",
    val = {
        "                                                               ▄▄                   ",
        " ▀████▀                                         ▀████▀   ▀███▀ ██                   ",
        "   ██                                             ▀██     ▄█                        ",
        "   ██     ▀███  ▀███ ▀████████▄  ▄█▀██▄ ▀███▄███   ██▄   ▄█  ▀███ ▀████████▄█████▄  ",
        "   ██       ██    ██   ██    ██ ██   ██   ██▀ ▀▀    ██▄  █▀    ██   ██    ██    ██  ",
        "   █▓     ▄ ▓█    ██   █▓    ██ ▓█   ▓█   █▓        ▀▓█ ▓▀     ▓█   ▓█    ██    ██  ",
        "   █▓    ▒█ ▓█    █▓   █▓    ▓█ █▓   ▓█   █▓         ▓██▄      ▓█   ▓█    ▓█    ██  ",
        "   ▓▓     ▓ ▓█    ▓▓   ▓▓    ▓▓ █▓   ▒▓   ▓▓         ▓▓ ▓▀     ▓▓   ▓▓    ▓▓    ▓▓  ",
        "   ▓▒    ▓▓ ▓▓    ▓▓   ▓▓    ▓▓ ▓▓   ▒▓   ▓▒         ▓▓▒▒      ▓▓   ▒▓    ▒▓    ▓▓  ",
        " ▒▓▒▒▓▓▒▓▒  ▒▒▓▓▒▓▒▓▒▒ ▒▒▒  ▒▓▒  ▓▒▓▒▒▓▒▒ ▒▒▒         ▒      ▒▓▒▓▒▒ ▒▓▒  ▒▒▒   ▒▒▓▒ ",
    },
    opts = {
        position = "center",
        hl = "AlphaHeader",
    },
}

local function version()
    local git_utils = require("lvim.utils.git")
    local branch = git_utils.get_lvim_branch()

    if branch ~= "HEAD" or "" then
        return branch .. "-" .. git_utils.get_lvim_current_sha()
    end

    return "v" .. git_utils.get_lvim_tag()
end

local footer = {
    type = "text",
    val = align_center({ width = 0 }, { "lunarvim.org", version() }, 0.5),
    opts = {
        position = "center",
        hl = "AlphaFooter",
    },
}

local buttons = {
    type = "group",
    entries = {
        { "SPC f f", "  Find Files", "<cmd>Telescope find_files<cr>" },
        { "SPC f p", "  Find Projects", "<cmd>Telescope projects<cr>" },
        { "SPC f r", "  Find Recent Files", "<cmd>Telescope oldfiles<cr>" },
        { "SPC f w", "  Find Text", "<cmd>Telescope live_grep<cr>" },
        {
            "SPC l c",
            "  Edit Configuration",
            "<cmd>edit " .. require("lvim.config").get_user_config_path() .. "<cr>",
        },
    },
    opts = {
        spacing = 1,
    },
}

local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl_shortcut = "AlphaShortcut",
    }

    if keybind then
        keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    return {
        type = "button",
        val = txt,
        opts = opts,
    }
end


local function resolve_buttons(entries)
    local val = {}

    for _, entry in pairs(entries) do
        local button_el = button(entry[1], entry[2], entry[3])
        button_el.opts.hl = "AlphaButton"
        button_el.on_press = function()
            local sc_ = entry[1]:gsub("%s", ""):gsub("SPC", "<leader>")
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
        end
        table.insert(val, button_el)
    end

    return val
end

buttons.val = resolve_buttons(buttons.entries)

local section = {
    header = header,
    buttons = buttons,
    footer = footer,
}

alpha.dashboard.section = section
