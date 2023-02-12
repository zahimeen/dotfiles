local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- quickly exit alpha
autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }
    vim.keymap.set("n", "q", ":qa<cr>", opts)
    vim.keymap.set("n", "<esc>", ":qa<cr>", opts)
    vim.opt_local.buflisted = false
  end,
})

-- highlight yanked region
autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 100 }
  end,
})

opt.relativenumber = true
opt.colorcolumn = "80"
opt.expandtab = false
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.wrap = false
opt.linebreak = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.foldmethod = "marker"
