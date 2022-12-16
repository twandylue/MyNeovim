local status, chat = pcall(require, "chatgpt")
if not status then
  print("chatGPT is not installed or API key is not set correctly")
  return
end

chat.setup({})
