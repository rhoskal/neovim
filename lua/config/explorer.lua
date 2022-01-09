-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

local status_ok, explorer = pcall(require, "nvim-tree")
if not status_ok then
  return
end

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_highlight_opened_files = 1

explorer.setup {
  auto_close = true,
  filters = {
    dotfiles = true,
  },
  git = {
    enable = false,
  },
}

keymap("n", "<leader>t", ":NvimTreeToggle<CR>")
keymap("n", "<leader>tr", ":NvimTreeRefresh<CR>")
