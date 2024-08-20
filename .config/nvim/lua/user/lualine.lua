local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  return
end

lualine.setup({
  options = {
    theme = "catppuccin",
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
