require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/LuaSnip/" })

local status_vscode, from_vscode = pcall(require, "luasnip.loaders.from_vscode")
if not status_vscode then
  print("luasnip_vscode is not installed")
  return
end
from_vscode.lazy_load({ include = { "python", "rust", "cpp", "c" } })

local status, ls = pcall(require, "luasnip")
if not status then
  print("luasnip is not installed")
  return
end

ls.config.set_config({
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",
  update_events = "TextChanged,TextChangedI",
})

vim.cmd([[
  " Use Tab to expand and jump through snippets
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

  " Use Shift-Tab to jump backwards through snippets
  imap <silent><expr> <C-p> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-p>'
  smap <silent><expr> <C-p> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-p>'

  " " Cycle forward through choice nodes with Control-f (for example)
  " imap <silent><expr> <C-p> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-p>'
  " smap <silent><expr> <C-p> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-p>'
]])
