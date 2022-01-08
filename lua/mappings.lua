local function map(mode, key, action, extra)
  local options = { noremap = true, silent = true }

  if extra then
    options = vim.tbl_extend("force", options, extra)
  end

  vim.api.nvim_set_keymap(mode, key, action, options)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize windows with arrow keys
map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Reselect visual selection after indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Allow "go-to-file" to open non-existent files
map("", "gf", ":edit <cfile><CR>")

-- Easy buffer switching
map("v", "<TAB>", ":bnext<CR>")
map("v", "<S-TAB>", ":bprevious<CR>")

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")
