local status_ok, blink = pcall(require, "blink.cmp")
if not status_ok then
  return
end

blink.setup {
  keymap = {
    ["<C-j>"] = { "select_next" },
    ["<C-k>"] = { "select_prev" },
    ["<C-b>"] = { "scroll_documentation_up" },
    ["<C-f>"] = { "scroll_documentation_down" },
    ["<C-space>"] = { "show" },
    ["<C-e>"] = { "hide" },
    ["<CR>"] = { "accept", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    ghost_text = { enabled = true },
    documentation = {
      window = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      },
    },
    menu = {
      draw = {
        columns = {
          { "kind_icon" },
          { "label", "label_description", gap = 1 },
          { "source_name" },
        },
        components = {
          kind_icon = {
            text = function(ctx)
              return require("lspkind").symbol_map[ctx.kind] or ""
            end,
          },
        },
      },
    },
  },
  sources = {
    default = { "lsp", "path", "buffer", "snippets" },
  },
}
