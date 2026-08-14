local status_ok, ts = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

ts.setup {
  ensure_installed = {
    "javascript", "typescript", "tsx", "html", "css",
    "python", "sql",
    "json", "yaml", "bash", "dockerfile",
  },
}

local highlight_disabled = { yaml = true }
local indent_disabled = { yaml = true }

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if highlight_disabled[vim.bo[ev.buf].filetype] then return end
    pcall(vim.treesitter.start, ev.buf)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    if indent_disabled[vim.bo[ev.buf].filetype] then return end
    local ok, _ = pcall(function()
      vim.bo[ev.buf].indentexpr =
        "v:lua.require'nvim-treesitter'.indentexpr()"
    end)
    if not ok then return end
  end,
})
