local status, todoComment = pcall(require, 'todo-comments')
if (not status) then return end

todoComment.setup {}
