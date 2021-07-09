require("which-key").setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
        },
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 5, -- spacing between columns
    },
    show_help = true, -- show help message on the command line when the popup is visible
})

---  LEADER KEY  ---

vim.api.nvim_set_keymap("n", "<Space>", "<NOP>", { noremap = true, silent = true })
vim.g.mapleader = " "

---  HELPERS  ---

local opts_normal = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local opts_insert = {
    mode = "i", -- INSERT mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local opts_visual = {
    mode = "v", -- VISUAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local opts_normal_non_leader = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

---  KEYBINDINGS  ---

local mappings_normal = {

    ["/"] = { "<Plug>kommentary_line_default", "Comment/Uncomment" },

    b = {
        name = "Buffers",
        d = { "<cmd>bdelete<CR>", "Delete Buffer" },
        n = { "<cmd>bnext<CR>", "Next Buffer" },
        p = { "<cmd>bprevious<CR>", "Previous Buffer" },
    },
    w = {
        name = "Window",
        h = { "<C-w>h", "Focus Left Window" },
        j = { "<C-w>j", "Focus Beneath Window" },
        k = { "<C-w>k", "Focus Above Window" },
        l = { "<C-w>l", "Focus Right Window" },
        s = { "<C-w>s", "Create Split" },
        v = { "<C-w>v", "Create Vertical Split" },
    },
    f = {
        name = "File",
        f = { "<cmd>Telescope find_files<CR>", "Find File" },
        r = { "<cmd>Telescope oldfiles<CR>", "Recent File" },
        w = { "<cmd>Telescope live_grep<CR>", "Find File With Word" },
        n = { "<cmd>DashboardNewFile<CR>", "New File" },
    },
    o = {
        name = "Open/Toggle",
        e = { "<cmd>lua require'plugins.nvimtree'.toggle_tree()<CR>", "Toggle NvimTree" },
        z = { "<cmd>TZAtaraxis<CR>", "Toggle Zen Ataraxis" },
        m = { "<cmd>TZMinimalist<CR>", "Toggle Zen Minimalist" },
        d = { "<cmd>Dashboard<CR>", "Open Dashboard" },
    },
    s = {
        name = "Session",
        s = { "<cmd>SessionSave<CR>", "Session Save" },
        l = { "<cmd>SessionLoad<CR>", "Session Load" },
    },
}

local mappings_insert = {
    ["<Up>"] = { '<cmd>echo "No up for you!"<CR>', "" },
    ["<Down>"] = { '<cmd>echo "No down for you!"<CR>', "" },
    ["<Left>"] = { '<cmd>echo "No left for you!"<CR>', "" },
    ["<Right>"] = { '<cmd>echo "No right for you!"<CR>', "" },
}

local mappings_visual = {
    [">"] = { ">gv", "" },
    ["<"] = { "<gv", "" },

    ["<leader>/"] = { "<Plug>kommentary_visual_default", "Comment/Uncomment" },
    ["gc"] = { "<Plug>kommentary_visual_default", "Comment/Uncomment" },
}

local mappings_normal_non_leader = {
    ["<S-x>"] = { "<cmd>BufferClose<CR>", "Delete Buffer" },
    ["<TAB>"] = { "<cmd>BufferNext<CR>", "Next Buffer" },
    ["<S-TAB>"] = { "<cmd>BufferPrevious<CR>", "Previous Buffer" },

    ["gcc"] = { "<Plug>kommentary_line_default", "Comment/Uncomment" },
    ["i"] = { "zzi", "" },

    ["<C-l>"] = { "<cmd>vnew term://" .. SHELL .. " <CR>", "Open Vertical Terminal" },
    ["<C-s>"] = { "<cmd>split term://" .. SHELL .. " | resize 10 <CR>", "Open Split Terminal" },
}

---  MAKE WHICH KEY READ THE KEYBINDINGS  ---

local wk = require("which-key")
wk.register(mappings_normal, opts_normal)
wk.register(mappings_insert, opts_insert)
wk.register(mappings_visual, opts_visual)
wk.register(mappings_normal_non_leader, opts_normal_non_leader)
