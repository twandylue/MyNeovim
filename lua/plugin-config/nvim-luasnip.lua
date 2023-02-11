local status, from_vscode = pcall(require, "luasnip.loaders.from_vscode")
if not status then
  print("luasnip is not installed")
  return
end

from_vscode.lazy_load()
