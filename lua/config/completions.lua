-- Plugin: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp

local status_ok, completions = pcall(require, "cmp")
if not status_ok then
  return
end

-- find more here: https://www.nerdfonts.com/cheat-sheet
local kind_icons = {
  Class = "ﴯ",
  Color = "",
  Constant = "",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "",
  Function = "",
  Interface = "",
  Keyword = "",
  Method = "",
  Module = "",
  Operator = "",
  Property = "ﰠ",
  Reference = "",
  Snippet = "",
  Struct = "פּ",
  Text = "",
  TypeParameter = "",
  Unit = "塞",
  Value = "",
  Variable = "",
}

completions.setup({
  documentation = {
    border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        path = "[Path]",
      })[entry.source.name]

      return vim_item
    end
  },
  mapping = {
    ["<CR>"] = completions.mapping.confirm {
      behavior = completions.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = function(fallback)
      if completions.visible() then
        completions.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if completions.visible() then
        completions.select_prev_item()
      else
        fallback()
      end
    end,
    ["<C-d>"] = completions.mapping.scroll_docs(-4),
    ["<C-f>"] = completions.mapping.scroll_docs(4),
    ["<C-e>"] = completions.mapping.close(),
  },
  sources = {
    { name = "nvim_lsp" }, -- must come first
    { name = "path" },
  }
})

