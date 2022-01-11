-- Plugin: nvim-cmp
-- https://github.com/hrsh7th/nvim-cmp

local status_ok, completions = pcall(require, "cmp")
if not status_ok then
  return
end

completions.setup({
  sources = {

  }
})

