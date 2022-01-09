-- Plugin: alpha-nvim
-- https://github.com/goolord/alpha-nvim

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)

  b.opts.hl = "Function"
  b.opts.hl_shortcut = "Type"

  return b
end

dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

dashboard.section.footer.val = function()
  local total_plugins = #vim.tbl_keys(packer_plugins)
  return "Packer loaded " .. total_plugins .. " plugins"
end
dashboard.section.footer.opts.hl = "Constant"

dashboard.section.buttons.val = {
  button("SPC u", "  Update plugins", ":PackerUpdate<CR>"),
  button("SPC f p", "  Settings", ":e $MYVIMRC<CR>"),
  button("SPC f f", "  Find file"),
}

alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

