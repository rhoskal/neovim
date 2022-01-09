-- Plugin: tokyonight
-- https://github.com/folke/tokyonight.nvim/

local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true

vim.api.nvim_exec([[colorscheme tokyonight]], false)
