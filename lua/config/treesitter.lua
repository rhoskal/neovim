-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter

require("nvim-treesitter.configs").setup {
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
  },
}
