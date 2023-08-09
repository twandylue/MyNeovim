local status, comment = pcall(require, "Comment")
if not status then
  print("Comment.nvim is not installed")
  return
end

comment.setup()
