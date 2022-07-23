local toggleterm = lvim.builtin.terminal

toggleterm.active = true
toggleterm.direction = "float"
toggleterm.size = 10
toggleterm.float_opts.border = "curved"
toggleterm.open_mapping = "<C-t>"
toggleterm.float_opts.highlights = {
    background = "ToggleTermNormal",
    border = "ToggleTermBorder",
}

local terminals = {}

local Terminal = require("toggleterm.terminal").Terminal

function terminals.run_py_file()
    local run_py_file = Terminal:new({
        cmd = "python " .. vim.api.nvim_buf_get_name(0),
        hidden = false,
        close_on_exit = false,
        direction = "horizontal",
    })
    run_py_file:toggle()
end

return terminals
