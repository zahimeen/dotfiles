local vim = vim

local works, feline = pcall(require, "feline")
if not works then
   return
end

local config = {
    colors = require("hl_themes." .. lvim.colorscheme),
    lsp = require("feline.providers.lsp"),
    lsp_severity = vim.diagnostic.severity,
    config = {
        shortline = false,
        shown = {},
        hidden = {
            "help",
            "NvimTree",
            "terminal",
            "alpha",
        },
    }
}

config.statusline_style = {
    left = "",
    right = " ",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
}

-- show short statusline on small screens
config.shortline = false

-- Initialize the components table
config.components = {
   active = {},
}

config.main_icon = {
   provider = config.statusline_style.main_icon,

   hl = {
      fg = config.colors.statusline_bg,
      bg = config.colors.nord_blue,
   },

   right_sep = {
      str = config.statusline_style.right,
      hl = {
         fg = config.colors.nord_blue,
         bg = config.colors.lightbg,
      },
   },
}

config.file_name = {
   provider = function()
      local filename = vim.fn.expand "%:t"
      local extension = vim.fn.expand "%:e"
      local icon = require("nvim-web-devicons").get_icon(filename, extension)
      if icon == nil then
         icon = " "
         return icon
      end
      return " " .. icon .. " " .. filename .. " "
   end,
   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
   end,
   hl = {
      fg = config.colors.white,
      bg = config.colors.lightbg,
   },

   right_sep = {
      str = config.statusline_style.right,
      hl = { fg = config.colors.lightbg, bg = config.colors.lightbg2 },
   },
}

config.dir_name = {
   provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      return "  " .. dir_name .. " "
   end,

   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 80
   end,

   hl = {
      fg = config.colors.grey_fg2,
      bg = config.colors.lightbg2,
   },
   right_sep = {
      str = config.statusline_style.right,
      hi = {
         fg = config.colors.lightbg2,
         bg = config.colors.statusline_bg,
      },
   },
}

config.diff = {
   add = {
      provider = "git_diff_added",
      hl = {
         fg = config.colors.grey_fg2,
         bg = config.colors.statusline_bg,
      },
      icon = " ",
   },

   change = {
      provider = "git_diff_changed",
      hl = {
         fg = config.colors.grey_fg2,
         bg = config.colors.statusline_bg,
      },
      icon = "  ",
   },

   remove = {
      provider = "git_diff_removed",
      hl = {
         fg = config.colors.grey_fg2,
         bg = config.colors.statusline_bg,
      },
      icon = "  ",
   },
}

config.git_branch = {
   provider = "git_branch",
   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
   end,
   hl = {
      fg = config.colors.grey_fg2,
      bg = config.colors.statusline_bg,
   },
   icon = "  ",
}

config.diagnostic = {
   error = {
      provider = "diagnostic_errors",
      enabled = function()
         return config.lsp.diagnostics_exist(config.lsp_severity.ERROR)
      end,

      hl = { fg = config.colors.red },
      icon = "  ",
   },

   warning = {
      provider = "diagnostic_warnings",
      enabled = function()
         return config.lsp.diagnostics_exist(config.lsp_severity.WARN)
      end,
      hl = { fg = config.colors.yellow },
      icon = "  ",
   },

   hint = {
      provider = "diagnostic_hints",
      enabled = function()
         return config.lsp.diagnostics_exist(config.lsp_severity.HINT)
      end,
      hl = { fg = config.colors.grey_fg2 },
      icon = "  ",
   },

   info = {
      provider = "diagnostic_info",
      enabled = function()
         return config.lsp.diagnostics_exist(config.lsp_severity.INFO)
      end,
      hl = { fg = config.colors.green },
      icon = "  ",
   },
}

config.lsp_progress = {
   provider = function()
      local Lsp = vim.lsp.util.get_progress_messages()[1]

      if Lsp then
         local msg = Lsp.message or ""
         local percentage = Lsp.percentage or 0
         local title = Lsp.title or ""
         local spinners = {
            "",
            "",
            "",
         }

         local success_icon = {
            "",
            "",
            "",
         }

         local ms = vim.loop.hrtime() / 1000000
         local frame = math.floor(ms / 120) % #spinners

         if percentage >= 70 then
            return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
         end

         return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
      end

      return ""
   end,
   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 80
   end,
   hl = { fg = config.colors.green },
}

config.lsp_icon = {
   provider = function()
      if next(vim.lsp.buf_get_clients()) ~= nil then
         return "  LSP"
      else
         return ""
      end
   end,
   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
   end,
   hl = { fg = config.colors.grey_fg2, bg = config.colors.statusline_bg },
}

config.mode_colors = {
   ["n"] = { "NORMAL", config.colors.red },
   ["no"] = { "N-PENDING", config.colors.red },
   ["i"] = { "INSERT", config.colors.dark_purple },
   ["ic"] = { "INSERT", config.colors.dark_purple },
   ["t"] = { "TERMINAL", config.colors.green },
   ["v"] = { "VISUAL", config.colors.cyan },
   ["V"] = { "V-LINE", config.colors.cyan },
   [""] = { "V-BLOCK", config.colors.cyan },
   ["R"] = { "REPLACE", config.colors.orange },
   ["Rv"] = { "V-REPLACE", config.colors.orange },
   ["s"] = { "SELECT", config.colors.nord_blue },
   ["S"] = { "S-LINE", config.colors.nord_blue },
   [""] = { "S-BLOCK", config.colors.nord_blue },
   ["c"] = { "COMMAND", config.colors.pink },
   ["cv"] = { "COMMAND", config.colors.pink },
   ["ce"] = { "COMMAND", config.colors.pink },
   ["r"] = { "PROMPT", config.colors.teal },
   ["rm"] = { "MORE", config.colors.teal },
   ["r?"] = { "CONFIRM", config.colors.teal },
   ["!"] = { "SHELL", config.colors.green },
}

config.chad_mode_hl = function()
   return {
      fg = config.mode_colors[vim.fn.mode()][2],
      bg = config.colors.one_bg,
   }
end

config.empty_space = {
   provider = " " .. config.statusline_style.left,
   hl = {
      fg = config.colors.one_bg2,
      bg = config.colors.statusline_bg,
   },
}

-- this matches the vi mode color
config.empty_spaceColored = {
   provider = config.statusline_style.left,
   hl = function()
      return {
         fg = config.mode_colors[vim.fn.mode()][2],
         bg = config.colors.one_bg2,
      }
   end,
}

config.mode_icon = {
   provider = config.statusline_style.vi_mode_icon,
   hl = function()
      return {
         fg = config.colors.statusline_bg,
         bg = config.mode_colors[vim.fn.mode()][2],
      }
   end,
}

config.empty_space2 = {
   provider = function()
      return " " .. config.mode_colors[vim.fn.mode()][1] .. " "
   end,
   hl = config.chad_mode_hl,
}

config.separator_right = {
   provider = config.statusline_style.left,
   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
   end,
   hl = {
      fg = config.colors.grey,
      bg = config.colors.one_bg,
   },
}

config.separator_right2 = {
   provider = config.statusline_style.left,
   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
   end,
   hl = {
      fg = config.colors.green,
      bg = config.colors.grey,
   },
}

config.position_icon = {
   provider = config.statusline_style.position_icon,
   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
   end,
   hl = {
      fg = config.colors.black,
      bg = config.colors.green,
   },
}

config.current_line = {
   provider = function()
      local current_line = vim.fn.line "."
      local total_line = vim.fn.line "$"

      if current_line == 1 then
         return " Top "
      elseif current_line == vim.fn.line "$" then
         return " Bot "
      end
      local result, _ = math.modf((current_line / total_line) * 100)
      return " " .. result .. "%% "
   end,

   enabled = config.shortline or function(winid)
      return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
   end,

   hl = {
      fg = config.colors.green,
      bg = config.colors.one_bg,
   },
}

local function add_table(a, b)
   table.insert(a, b)
end

-- components are divided in 3 sections
config.left = {}
config.middle = {}
config.right = {}

-- left
add_table(config.left, config.main_icon)
add_table(config.left, config.file_name)
add_table(config.left, config.dir_name)
add_table(config.left, config.diff.add)
add_table(config.left, config.diff.change)
add_table(config.left, config.diff.remove)
add_table(config.left, config.diagnostic.error)
add_table(config.left, config.diagnostic.warning)
add_table(config.left, config.diagnostic.hint)
add_table(config.left, config.diagnostic.info)

add_table(config.middle, config.lsp_progress)

-- right
add_table(config.right, config.lsp_icon)
add_table(config.right, config.git_branch)
add_table(config.right, config.empty_space)
add_table(config.right, config.empty_spaceColored)
add_table(config.right, config.mode_icon)
add_table(config.right, config.empty_space2)
add_table(config.right, config.separator_right)
add_table(config.right, config.separator_right2)
add_table(config.right, config.position_icon)
add_table(config.right, config.current_line)

config.components.active[1] = config.left
config.components.active[2] = config.middle
config.components.active[3] = config.right

feline.setup({
  theme = {
     bg = config.colors.statusline_bg,
     fg = config.colors.fg,
  },
  components = config.components,
})
