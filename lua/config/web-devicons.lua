-- Plugin: nvim-web-devicons
-- https://github.com/kyazdani42/nvim-web-devicons

local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

devicons.get_icons()
