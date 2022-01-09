-- Plugin: lualine
-- https://github.com/nvim-lualine/lualine.nvim

local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    theme = "tokyonight",
    component_separators = "|",
    section_separators = {
      left = "",
      right = "",
    },
  },
  sections = {
    lualine_a = {
      {
        "mode",
        separator = {
          left = ""
        },
        right_padding = 2
      },
    },
    lualine_b = { "filename", "branch" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = {
          "error",
          "warn",
          "info",
          "hint",
        },
        update_in_insert = false,
        always_visible = true,
      },
    },
    lualine_z = {
      {
        "location",
        separator = {
          right = "",
        },
        left_padding = 2,
      },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
}
