-- Plugin: lualine
-- https://github.com/nvim-lualine/lualine.nvim

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local function hide_in_small_windows()
  return vim.fn.winwidth(0) > 50
end

lualine.setup {
  options = {
    theme = "auto",
    component_separators = "|",
    section_separators = {
      left = "",
      right = "",
    },
    disabled_filetypes = { "packer" },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        cond = hide_in_small_windows,
      },
    },
    lualine_b = { "filename" },
    lualine_c = {
      {
        "diagnostics",
        cond = hide_in_small_windows,
        sources = { "nvim_diagnostic" },
        sections = {
          "error",
          "warn",
          "info",
          -- "hint",
        },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          -- hint = " ",
        },
        update_in_insert = false,
        always_visible = true,
      },
    },
    lualine_x = {
      {
        function()
          local clients = vim.lsp.get_active_clients()

          if next(clients) == nil then
            return "No LSP's"
          else
            return "LSP's active"
          end
        end,
        cond = hide_in_small_windows,
        icon = " ",
      },
    },
    lualine_y = {
      {
        "branch",
        cond = hide_in_small_windows,
      },
    },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "progress" },
  },
  tabline = {},
  extensions = { "nvim-tree" },
}
