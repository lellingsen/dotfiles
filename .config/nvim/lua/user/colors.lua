vim.o.background = "dark"

require("gruvbox").setup({
  italic = false
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

vim.g.nord_borders = true
vim.g.nord_italic = false

local colorscheme = "onenord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
