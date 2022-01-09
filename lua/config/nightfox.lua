-- Plugin: nightfox
-- https://github.com/EdenEast/nightfox.nvim

local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  return
end

nightfox.load("nordfox")
