local python_arguments = {}

require("lspconfig").efm.setup({
    -- init_options = {initializationOptions},
    cmd = { DATA_PATH .. "/lspinstall/efm/efm-langserver" },
    init_options = { documentFormatting = true, codeAction = false },
    filetypes = { "python" },
    settings = {
        rootMarkers = { ".git/", "requirements.txt" },
        languages = {
            python = python_arguments,
        },
    },
})

require("lspconfig").pyright.setup({
    cmd = {
        DATA_PATH .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
        "--stdio",
    },
    on_attach = require("lsp").common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = true,
        }),
    },
    settings = {
        python = {
            analysis = {
                typeCheckingMode = true,
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            },
        },
    },
})
