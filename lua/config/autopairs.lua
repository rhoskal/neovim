-- Plugin: nvim-autopairs
-- https://github.com/windwp/nvim-autopairs

local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

autopairs.setup({
  check_ts = true,
})
