local M = {}

-- M.disabled = {}

M.general = {
  n = {
    ["J"] = { "mzJ`z", "" },
    ["n"] = { "nzzzv", "" },
    ["N"] = { "Nzzzv", "" },
    ["Q"] = { "<nop>", "" },
    ["X"] = { "<cmd>bdelete<cr>", "" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "" },
    ["K"] = { ":m '<-2<CR>gv=gv", "" },
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "toggle nvimtree" },
  },
}

M.guessindent = {
  n = {
    ["<leader>i"] = { "<cmd>GuessIndent<cr>", "guess indent" },
  },
}

M.telescope = {
  n = {
    ["<leader><space>"] = {
      function()
        local git, _ = pcall(vim.cmd, "Telescope git_files")

        if not git then
          vim.cmd "Telescope find_files"
        end
      end,
      "find project files",
    },
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "find files" },
    ["<leader>fg"] = { "<cmd>Telescope git_files<cr>", "find git files" },
    ["<leader>fw"] = { "<cmd>Telescope live_grep<cr>", "find word" },
    ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "find oldfiles" },
  },
}

local tmux = require "tmux"
M.tmux = {
  i = {
    ["<A-h>"] = { tmux.resize_left, "" },
    ["<A-j>"] = { tmux.resize_bottom, "" },
    ["<A-k>"] = { tmux.resize_top, "" },
    ["<A-l>"] = { tmux.resize_right, "" },
    ["<C-h>"] = { tmux.move_left, "" },
    ["<C-j>"] = { tmux.move_bottom, "" },
    ["<C-k>"] = { tmux.move_top, "" },
    ["<C-l>"] = { tmux.move_right, "" },
  },
}

M.harpoon = {
  n = {
    ["<leader>n"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "add harpoon file" },
    ["<leader>h"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "toggle harpoon quick menu" },
    ["<A-1>"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "" },
    ["<A-2>"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "" },
    ["<A-3>"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "" },
    ["<A-4>"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "" },
  },
}

M.zen = {
  n = {
    ["<leader>z"] = { "<cmd>ZenMode<cr>", "zen mode" },
  },
}

return M
