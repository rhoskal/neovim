-- Plugin: toggleterm
-- https://github.com/akinsho/toggleterm.nvim

local status_ok, terminal = pcall(require, "toggleterm")
if not status_ok then
  return
end

terminal.setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 25
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = "1",
  start_in_insert = true,
  insert_mappings = false,
  terminal_mappings = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "double",
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  hidden = true,
})
function _lazygit_toggle()
  lazygit:toggle()
end

function _set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua _set_terminal_keymaps()")
