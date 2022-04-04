-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

local status_ok, explorer = pcall(require, "nvim-tree")
if not status_ok then
  return
end

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.vim_tree_special_files = {
  "README.md",
  "Makefile",
}

explorer.setup {
  filters = {
    dotfiles = true,
  },
  ignore_ft_on_setup = {
    "alpha",
  },
}
