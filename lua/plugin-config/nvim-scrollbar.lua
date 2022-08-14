local status, sidebar = pcall(require, 'scrollbar')
if (not status) then
  print("scrollbar is not installed")
  return
end

sidebar.setup {
  handle = {
    color = '#d19a66',
  },
  -- marks = {
  --     Search = { color = colors.orange },
  --     Error = { color = colors.error },
  --     Warn = { color = colors.warning },
  --     Info = { color = colors.info },
  --     Hint = { color = colors.hint },
  --     Misc = { color = colors.purple },
  -- }
}
