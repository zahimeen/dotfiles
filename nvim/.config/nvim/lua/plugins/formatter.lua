local M = {}

M.config = function()
    require("formatter").setup({
        logging = false,
        filetype = {
            javascript = {
                function()
                    return {
                        exe = "prettier",
                        args = { "--parser babel", "-w" },
                        stdin = true,
                    }
                end,
            },
            html = {
                function()
                    return {
                        exe = "prettier",
                        args = { "--parser html", "-w" },
                        stdin = true,
                    }
                end,
            },
            css = {
                function()
                    return {
                        exe = "prettier",
                        args = { "--parser css", "-w" },
                        stdin = true,
                    }
                end,
            },
            json = {
                function()
                    return {
                        exe = "prettier",
                        args = { "--parser json" },
                        stdin = true,
                    }
                end,
            },
            lua = {
                function()
                    return {
                        exe = "stylua",
                        args = { "--search-parent-directories" },
                        stdin = false,
                    }
                end,
            },
        },
    })
end

return M
