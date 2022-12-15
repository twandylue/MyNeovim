local status, chat = pcall(require, "chatgpt")
if not status then
  print("chatGPT is not installed")
  return
end

chat.setup({})
