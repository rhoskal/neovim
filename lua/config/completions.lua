-- Plugin: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp

local status_ok, completions = pcall(require, "cmp")
if not status_ok then
  return
end

completions.setup({
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
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
  }
})

