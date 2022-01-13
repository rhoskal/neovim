-- Plugin: which-key
-- https://github.com/folke/which-key.nvim

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
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
      "<cmd>lua vim.lsp.buf.code_action()<CR>",
      "Show code actions",
    },
    d = {
      "<cmd>lua vim.lsp.buf.definition()<CR>",
      "Jump to definition",
    },
    D = {
      "<cmd>lua vim.lsp.buf.declaration()<CR>",
      "Jump to declaration",
    },
    f = {
      "<cmd>lua vim.lsp.buf.formatting_sync()<CR>",
      "Format buffer",
    },
    i = {
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      "Find all implementations",
    },
    K = {
      "<cmd>lua vim.lsp.buf.hover()<CR>",
      "Quick info",
    },
    r = {
      "<cmd>lua vim.lsp.buf.references()<CR>",
      "Find all references",
    },
    R = {
      "<cmd>lua vim.lsp.buf.rename()<CR>",
      "Rename symbol",
    },
    t = {
      "<cmd>lua vim.lsp.buf.type_definition()<CR>",
      "Jump to type definition",
    },
    x = {
      "<cmd>Telescope diagnostics<CR>",
      "List errors",
    },
    ["["] = {
      "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
      "Goto previous diagnostic",
    },
    ["]"] = {
      "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
      "Goto next diagnostic",
    },
  },
  f = {
    name = "file",
    f = {
      "<cmd>Telescope find_files<CR>",
      "Find file",
    },
    r = {
      "<cmd>Telescope oldfiles<CR>",
      "Recent files",
    },
    s = {
      "<cmd>w<CR>",
      "Save file",
    },
  },
  g = {
    name = "git",
    B = {
      "<cmd>Gitsigns blame_line<CR>",
      "Git blame line",
    },
    s = {
      "<cmd>Gitsigns stage_hunk<CR>",
      "Git stage hunk",
    },
    S = {
      "<cmd>Gitsigns stage_buffer<CR>",
      "Git stage file",
    },
    u = {
      "<cmd>Gitsigns undo_stage_hunk<CR>",
      "Revert hunk",
    },
    ["["] = {
      "<cmd>Gitsigns prev_hunk<CR>",
      "Jump to previous hunk",
    },
    ["]"] = {
      "<cmd>Gitsigns next_hunk<CR>",
      "Jump to next hunk",
    },
  },
  s = {
    name = "search",
    b = {
      "<cmd>Telescope current_buffer_fuzzy_find<CR>",
      "Search buffer",
    },
    p = {
      "<cmd>Telescope grep_string<CR>",
      "Search project",
    },
  },
  w = {
    name = "window",
    d = {
      "<cmd>q<CR>",
      "Close current window",
    },
    m = {
      "<cmd>m<CR>",
      "Maximize current window",
    },
    s = {
      "<cmd>split<CR>",
      "Horizontal split",
    },
    v = {
      "<cmd>vsplit<CR>",
      "Vertical split",
    },
  },
}, { prefix = "<leader>" })
