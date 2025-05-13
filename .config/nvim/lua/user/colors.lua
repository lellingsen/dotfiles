vim.o.background = "dark"

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

vim.g.sonokai_style = 'espresso'
vim.g.sonokai_better_performance = 1

vim.g.nord_borders = true
vim.g.nord_italic = false

local colorscheme = "catppuccin"

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
