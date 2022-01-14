-- Plugin: which-key
-- https://github.com/folke/which-key.nvim

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local cmd = function(cmdline)
  return "<cmd>" .. cmdline .. "<CR>"
end

which_key.setup {

}

which_key.register({
  b = {
    name = "buffer",
    d = {
      "<cmd>bdelete<CR>",
      "Kill buffer",
    },
    l = {
      "<cmd>Telescope buffers<CR>",
      "List open buffers",
    },
    n = {
      "<cmd>bnext<CR>",
      "Next buffer",
    },
    p = {
      "<cmd>bprevious<CR>",
      "Previous buffer",
    },
  },
  c = {
    name = "code",
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    a = {
      cmd("lua vim.lsp.buf.code_action()"),
      "Show code actions",
    },
    d = {
      cmd("lua vim.lsp.buf.definition()"),
      "Jump to definition",
    },
    D = {
      cmd("lua vim.lsp.buf.declaration()"),
      "Jump to declaration",
    },
    f = {
      cmd("lua vim.lsp.buf.formatting_sync()"),
      "Format buffer",
    },
    i = {
      cmd("lua vim.lsp.buf.implementation()"),
      "Find all implementations",
    },
    K = {
      cmd("lua vim.lsp.buf.hover()"),
      "Quick info",
    },
    r = {
      cmd("lua vim.lsp.buf.references()"),
      "Find all references",
    },
    R = {
      cmd("lua vim.lsp.buf.rename()"),
      "Rename symbol",
    },
    t = {
      cmd("lua vim.lsp.buf.type_definition()"),
      "Jump to type definition",
    },
    x = {
      cmd("Telescope diagnostics"),
      "List errors",
    },
    ["["] = {
      cmd("lua vim.lsp.diagnostic.goto_prev()"),
      "Goto previous diagnostic",
    },
    ["]"] = {
      cmd("lua vim.lsp.diagnostic.goto_next()"),
      "Goto next diagnostic",
    },
  },
  f = {
    name = "file",
    f = {
      cmd("Telescope find_files"),
      "Find file",
    },
    r = {
      cmd("Telescope oldfiles"),
      "Recent files",
    },
    s = {
      cmd("w"),
      "Save file",
    },
  },
  g = {
    name = "git",
    B = {
      cmd("Gitsigns blame_line"),
      "Git blame line",
    },
    s = {
      cmd("Gitsigns stage_hunk"),
      "Git stage hunk",
    },
    S = {
      cmd("Gitsigns stage_buffer"),
      "Git stage file",
    },
    u = {
      cmd("Gitsigns undo_stage_hunk"),
      "Revert hunk",
    },
    ["["] = {
      cmd("Gitsigns prev_hunk"),
      "Jump to previous hunk",
    },
    ["]"] = {
      cmd("Gitsigns next_hunk"),
      "Jump to next hunk",
    },
  },
  s = {
    name = "search",
    b = {
      cmd("Telescope current_buffer_fuzzy_find"),
      "Search buffer",
    },
    p = {
      cmd("Telescope grep_string"),
      "Search project",
    },
  },
  w = {
    name = "window",
    c = {
      "<C-w>c<CR>",
      "Close current window",
    },
    m = {
      "",
      "Maximize current window",
    },
    O = {
      "<C-w>o<CR>",
      "Close all other windows",
    },
    R = {
      "<C-w>R<CR>",
      "Rotate windows",
    },
    s = {
      cmd("split"),
      "Horizontal split",
    },
    v = {
      cmd("vsplit"),
      "Vertical split",
    },
    ["="] = {
      "<C-w>=<CR>",
      "Balance windows",
    },
    ["<"] = {
      cmd("vertical resize -3"),
      "Decrease width",
    },
    [">"] = {
      cmd("vertical resize +3"),
      "Increase width",
    },
    ["+"] = {
      cmd("resize +3"),
      "Increase height",
    },
    ["-"] = {
      cmd("resize -3"),
      "Decrease height",
    },
  },
}, { prefix = "<leader>" })
