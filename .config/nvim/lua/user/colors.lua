vim.o.background = "dark"

local colorscheme = "rose-pine-moon"
local light_colorscheme = "rose-pine-dawn"

require("gruvbox").setup({
    italic = {
        strings = false,
    },
})

require("material").setup({
    disable = {
        colored_cursor = true
    }
})

require('nordic').setup({
    on_highlight = function(highlights, palette)
        highlights.Visual = {
            bg = palette.gray2
        }
    end
})

require("catppuccin").setup({
    flavour = "frappe",
    styles = {
        conditionals = {},
    }
})

local auto_dark_mode = require("auto-dark-mode")
auto_dark_mode.setup({
    update_interval = 1000,
    set_dark_mode = function()
        vim.o.background = "dark"
        vim.cmd("colorscheme " .. colorscheme)
    end,
    set_light_mode = function()
        vim.o.background = "light"
        vim.cmd("colorscheme " .. light_colorscheme)
    end,
})
auto_dark_mode.init()

vim.g.sonokai_style = 'espresso'
vim.g.sonokai_better_performance = 1

vim.g.nord_borders = true
vim.g.nord_italic = false

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  return
end

lualine.setup({
  options = {
    theme = colorscheme,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
    lualine_x = {
    },
    lualine_y = {
      'filetype'
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
  },
})
