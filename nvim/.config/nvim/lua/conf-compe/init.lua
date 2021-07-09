local M = {}

local vsnip_dir = vim.fn.stdpath("config") .. "/snippets"
vim.g.vsnip_snippet_dir = vsnip_dir

M.config = function()
    local opt = {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 1,
        preselect = "enable",
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = true,

        source = {
            path = { kind = "   (Path)" },
            calc = { kind = "   (Calc)" },
            vsnip = { kind = "   (Snippet)" },
            nvim_lsp = { kind = "   (LSP)" },
            nvim_lua = false,
            tags = false,
            vim_dadbod_completion = true,
            emoji = { kind = " ﲃ  (Emoji)", filetypes = { "markdown", "text" } },
            -- nvim_lua = {kind = "  "},
            -- treesitter = {kind = "  "},
            -- spell = { kind = "   (Spell)" },
            -- buffer = { kind = "   (Buffer)" },
        },
    }

    require("compe").setup(opt)

    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col(".") - 1
        if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
            return true
        else
            return false
        end
    end

    _G.tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t("<C-n>")
        elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
            return t("<Plug>(vsnip-expand-or-jump)")
            -- elseif check_back_space() then
            -- return t("<Tab>")
        else
            return t("<Tab>")
        end
    end

    _G.s_tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t("<C-p>")
        elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
            return t("<Plug>(vsnip-jump-prev)")
        else
            return t("<S-Tab>")
        end
    end

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
    vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

    vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", { noremap = true, silent = true, expr = true })
    vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", { noremap = true, silent = true, expr = true })
    vim.api.nvim_set_keymap(
        "i",
        "<C-f>",
        "compe#scroll({ 'delta': +4 })",
        { noremap = true, silent = true, expr = true }
    )
    vim.api.nvim_set_keymap(
        "i",
        "<C-d>",
        "compe#scroll({ 'delta': -4 })",
        { noremap = true, silent = true, expr = true }
    )
end

return M
