local temp_dir = "~/.tmp,/private/tmp//"
local options = {
  backupdir      = temp_dir,       -- store backup files here instead of next to file
  clipboard      = "unnamedplus",  -- copy paste between vim and everything else
  directory      = temp_dir,       -- store swap files here instead of next to file
  expandtab      = true,           -- convert tabs to spaces
  mouse          = "a",            -- enable mouse in all modes
  number         = true,           -- show line numbers
  relativenumber = true,           -- show relative line number
  ruler          = false,          -- no need to show line, col numbers of cursor position
  scrolloff      = 5,              -- keeping context is important
  shiftwidth     = 2,              -- number of spaces inserted for each indentation
  signcolumn     = "yes",          -- always display "gutter" to prevent shifting
  smartcase      = true,           -- be case sensitive during searches
  smartindent    = true,           --
  splitbelow     = true,           -- horizontal splits will go below the current window
  splitright     = true,           -- vertical splits will go right of the current window
  swapfile       = false,          --
  tabstop        = 2,              -- number of spaces inserted for a tab
  undodir        = temp_dir,       -- store undo files here instead of next to file
  wrap           = false,          -- display lines as one long line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.iskeyword:append({"-"})    -- treat dash separated words as a word
