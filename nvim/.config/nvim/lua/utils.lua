local utils = {}

function utils.check_lsp_client_active(name)
    local clients = vim.lsp.get_active_clients()
    for _, client in pairs(clients) do
        if client.name == name then
            return true
        end
    end
    return false
end

function utils.define_augroups(definitions) -- {{{1
    -- Create autocommand groups based on the passed definitions
    --
    -- The key will be the name of the group, and each definition
    -- within the group should have:
    --    1. Trigger
    --    2. Pattern
    --    3. Text
    for group_name, definition in pairs(definitions) do
        vim.cmd("augroup " .. group_name)
        vim.cmd("autocmd!")

        for _, def in pairs(definition) do
            local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
            vim.cmd(command)
        end
        vim.cmd("augroup END")
    end
end

utils.define_augroups({
    _terminal = {
        {
            "BufEnter",
            "term://*",
            "setlocal nocursorline nonumber norelativenumber laststatus=0",
        },
        {
            "BufEnter",
            "term://*",
            "startinsert",
        },
    },
})

return utils
