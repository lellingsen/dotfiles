vim.o.background = "dark"

require("gruvbox").setup({
})

require("material").setup({
  disable = {
    colored_cursor = true
  }
})

require("onenord").setup({
  fade_nc = true,
  styles = {
    comments = "italic",
  },
})

local c = require("nordic.colors")
require("nordic").load({
    override = {
        Visual = {
            bg = c.gray2
        }
    }
})

vim.g.nord_borders = true
vim.g.nord_italic = false

local colorscheme = "nordic"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
