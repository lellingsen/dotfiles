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
