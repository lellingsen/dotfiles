local status_ok, blink = pcall(require, "blink.cmp")
if not status_ok then
  return
end

-- find more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Text = "󰊄",
  Method = "m",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "󰮊",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

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
    kind_icons = kind_icons,
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
        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
      },
    },
  },
  sources = {
    default = { "lsp", "path", "buffer", "snippets" },
  },
}
