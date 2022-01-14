-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "dot",
    "elixir",
    "elm",
    "fish",
    "graphql",
    "haskell",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "lua",
    "make",
    "markdown",
    "nix",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  sync_install = false,
}
