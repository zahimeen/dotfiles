local M = {}

M.treesitter = {
  sync_install = true,
  auto_install = true,

  ensure_installed = {
    "c",
    "lua",
    "vim",
    "help",
    "python",
    "go",
    "javascript",
    "typescript",
    "css",
    "html",
    "json",
    "toml",
    "rust",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
    disable = { "python" },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "prettier",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  buftype_exclude = { "help", "nofile", "terminal", "prompt" },
  show_first_indent_level = true,
  char = "▏",
  context_char = "▏",
}

M.ui = {
  tabufline = {
    lazyload = false,
  },
}

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = "close",
        ["<C-h>"] = "which_key",
        ["<Tab>"] = "move_selection_next",
        ["<S-Tab>"] = "move_selection_previous",
      },
    },
  },
}

return M
