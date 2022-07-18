vim.o.background = "dark"

require("gruvbox").setup({
  italic = false
})

vim.g.nord_borders = true
vim.g.nord_italic = false

local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
