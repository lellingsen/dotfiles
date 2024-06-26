local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "javascript", "typescript", "tsx", "lua", "html" },
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
}

require'treesitter-context'.setup{
  max_lines = 4,
}
