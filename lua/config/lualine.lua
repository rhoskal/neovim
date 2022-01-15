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
    theme = "tokyonight",
    component_separators = "|",
    section_separators = {
      left = "",
      right = "",
    },
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
        },
        symbols = {
          error = " ",
          warn = " ",
          -- info = " ",
          -- hint = " ",
        },
        update_in_insert = false,
        always_visible = true,
      },
    },
    lualine_x = {
      {
        function()
          local msg = "No Language Server"
          local buf_file_type = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()

          if next(clients) == nil then
            return msg
          end

          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes

            if filetypes and vim.fn.index(filetypes, buf_file_type) ~= -1 then
              if client.name ~= "tailwindcss" then
                return client.name
              end
            end
          end

          return msg
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
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
}
