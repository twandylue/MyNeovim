local status, nvimsubstitute = pcall(require, "substitute")
if not status then
  print("substitute is not installed")
  return
end

nvimsubstitute.setup({
  on_substitute = nil,
  yank_substituted_text = false,
  range = {
    prefix = "s",
    prompt_current_text = false,
    confirm = false,
    complete_word = false,
    motion1 = false,
    motion2 = false,
    suffix = "",
  },
  exchange = {
    motion = false,
  },
})
