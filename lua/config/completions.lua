-- Plugin: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp

local status_cmp_ok, cmp = pcall(require, "cmp")
local status_snip_ok, luasnip = pcall(require, "luasnip")

if not (status_cmp_ok or status_snip_ok) then
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

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))

  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
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
    ["<CR>"] = cmp.mapping.confirm {
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping {
      c = cmp.mapping.close(),
      i = cmp.mapping.abort(),
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "path" },
  })
})

-- a better completion experience (from docs)
vim.o.completeopt = "menu,menuone,noselect"
