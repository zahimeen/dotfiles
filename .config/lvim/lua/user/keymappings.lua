local keys = lvim.builtin.which_key.mappings

lvim.leader = "space"

lvim.keys.normal_mode["<Tab>"] = "<cmd>BufferNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = "<cmd>BufferPrevious<CR>"
lvim.keys.normal_mode["<S-x>"] = "<cmd>BufferDelete<CR>"

keys.w = {
    name = "Windows",
    h = { "<C-w>h", "Window Left" },
    j = { "<C-w>j", "Window Down" },
    k = { "<C-w>k", "Window Up" },
    l = { "<C-w>l", "Window Right" },
    s = { "<C-w>s", "Window Split" },
    v = { "<C-w>v", "Window Vertical Split" },
}

keys.f = {
    name = "Find",
    f = { "<cmd>Telescope file_browser<CR>", "Find Files (Browser)" },
    F = { "<cmd>Telescope find_files<CR>", "Find Files" },
    c = { "<cmd>Telescope colorscheme<CR>", "Find Colorscheme" },
    C = { "<cmd>Telescope commands<CR>", "Find Commands" },
    p = { "<cmd>Telescope projects<CR>", "Find Projects" },
    k = { "<cmd>Telescope keymaps<CR>", "Find Keymaps" },
    w = { "<cmd>Telescope live_grep", "Find Word in File" },
    r = { "<cmd>Telescope oldfiles<CR>", "Find Recent Files" },
}

keys.b = {
    name = "Buffers",
    n = { "<cmd>BufferNext<CR>", "Buffer Next" },
    p = { "<cmd>BufferPrevious<CR>", "Buffer Previous" },
    d = { "<cmd>BufferDelete<CR>", "Buffer Delete" },
    j = { "<cmd>BufferPick<CR>", "Buffer Pick" },
    l = { "<cmd>BufferLast<CR>", "Buffer Last" },
}

keys.s = {
    name = "Sessions",
    s = { "<cmd>SessionSave<CR>", "Session Save" },
    l = { "<cmd>SessionLoad<CR>", "Session Load" },
}
