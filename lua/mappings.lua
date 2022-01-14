function keymap(mode, key, action, extra)
  local options = { noremap = true, silent = true }

  if extra then
    options = vim.tbl_extend("force", options, extra)
  end

  vim.api.nvim_set_keymap(mode, key, action, options)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Resize windows with arrow keys
keymap("n", "<C-Up>", ":resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Left>", ":vertical resize +2<CR>")
keymap("n", "<C-Right>", ":vertical resize -2<CR>")

-- Reselect visual selection after indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Allow "go-to-file" to open non-existent files
keymap("", "gf", ":edit <cfile><CR>")

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv")
keymap("x", "J", ":move '>+1<CR>gv-gv")

-- close all windows and exit from neovim
keymap("n", "<space>q", ":qa!<CR>")
