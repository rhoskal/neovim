-- Plugin: Comment.nvim
-- https://github.com/numToStr/Comment.nvim

local status_ok, comments = pcall(require, "Comment")
if not status_ok then
  return
end

comments.setup()
