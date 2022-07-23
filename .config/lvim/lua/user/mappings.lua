--[[

Set keymappings in this file.

Keymappings set with `lvim.keys` will not show up on whichkey.
Every map set with which-key will start with the `<leader>` key.

--]]

local lvim = lvim
lvim.leader = "space"

lvim.keys.normal_mode = {
    ["<S-l>"] = false,
    ["<S-h>"] = false,
    ["<Esc>"] = "<cmd>nohlsearch<CR>",
    ["<S-x>"] = "<cmd>BufferKill<cr>",
    ["<Tab>"] = "<cmd>BufferLineCycleNext<cr>",
    ["<S-Tab>"] = "<cmd>BufferLineCyclePrev<cr>",
    ["<C-a>"] = "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",
    ["<C-s>"] = "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",
    ["<C-d>"] = "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",
    ["<C-f>"] = "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",
}

lvim.keys.term_mode = {
    ["<Esc>"] = "<C-\\><C-n>",
}

lvim.builtin.which_key.mappings = {
    ["/"] = {
        "<cmd>lua require('Comment.api').toggle_current_linewise()<cr>",
        "Comment Cursor Line",
    },
    [";"] = { "<cmd>Alpha<CR>", "Redraw Dashboard" },
    [" "] = { "<cmd>Telescope find_files<cr>", "Find Files" },
    b = {
        name = "Buffers",
        d = { "<cmd>BufferKill<cr>", "Kill Current Buffer" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Go To Next Buffer" },
        p = { "<cmd>BufferLineCyclePrev<cr>", "Go To Previous Buffer" },
        j = { "<cmd>BufferLinePick<cr>", "Pick And Go To Buffer" },
        c = { "<cmd>BufferLinePickClose<cr>", "Pick And Close Buffer" },
    },
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        h = {
            "<cmd>Telescope find_hiles follow=true no_ignore=true hidden=true<cr>",
            "Find Hidden Files",
        },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
        r = { "<cmd>Telescope oldfiles<cr>", "Find Recent Files" },
        w = { "<cmd>Telescope live_grep<cr>", "Find Text" },
        p = { "<cmd>Telescope projects<cr>", "Find Projects" },
    },
    p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
    l = {
        name = "LSP",
        a = { "<cmd>lua require('lvim.core.telescope').code_actions()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
        k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        p = {
            name = "Peek",
            d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
            t = {
                "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>",
                "Type Definition",
            },
            i = {
                "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>",
                "Implementation",
            },
        },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    },
    o = {
        name = "Open",
        e = { "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree" },
        t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
    },
    h = {
        name = "Harpoon",
        a = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add Mark" },
        q = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle Menu" },
        n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next Mark" },
        p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous Mark" },
    },
    r = {
        name = "Run",
        p = {
            "<cmd>lua require('user.plugins.configs.toggleterm').run_py_file()<cr>",
            "Run Current Python File",
        },
    },
    d = {
        name = "Debug",
        b = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Set Breakpoint" },
        c = { "<cmd>lua require('dap').continue()<cr>", "Continue Debugging" },
        o = { "<cmd>lua require('dap').step_over()<cr>", "Step Over" },
        i = { "<cmd>lua require('dap').step_into()<cr>", "Step Into" },
        r = { "<cmd>lua require('dap').repl.open()<cr>", "Open REPL" },
    },
}
