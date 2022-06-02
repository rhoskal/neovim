-- Plugin: nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua

local status_ok, explorer = pcall(require, "nvim-tree")
if not status_ok then
  return
end


explorer.setup {
  filters = {
    dotfiles = true,
  },
  ignore_ft_on_setup = {
    "alpha",
  },
  renderer = {
    highlight_opened_files = "icon",
    indent_markers = {
      enable = true,
    },
    special_files = {
      "README.md",
      "Makefile",
    },
  },
  view = {
    width = 40,
  }
}
