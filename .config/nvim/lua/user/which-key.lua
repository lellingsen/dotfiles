local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

which_key.setup()

which_key.add({
  { "<leader>d", group = "Debug" },
  { "<leader>f", desc = "Find files" },
  { "<leader>F", desc = "Find files (hidden)" },
  { "<leader>g", desc = "Live grep" },
  { "<leader>G", desc = "Live grep (args)" },
  { "<leader>b", desc = "Buffers" },
  { "<leader>e", desc = "File explorer" },
  { "<leader>m", desc = "Format buffer" },
  { "<leader>t", desc = "Todo (Telescope)" },
})
