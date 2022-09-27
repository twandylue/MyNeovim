local status, todoComment = pcall(require, 'todo-comments')
if (not status) then
  print("todo-comments is not installed")
  return
end

todoComment.setup {}
