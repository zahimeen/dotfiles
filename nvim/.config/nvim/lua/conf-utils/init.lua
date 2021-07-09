local auto_utils = {}

function auto_utils.define_augroups(definitions) -- {{{1
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

auto_utils.define_augroups({
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

return auto_utils
