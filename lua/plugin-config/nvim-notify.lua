local status, notify = pcall(require, "notify")
if not status then
  vim.notify("nvim-notify is not installed", vim.log.levels.ERROR)
  print("nvim-notify is not installed")
  return
end

vim.notify = notify
notify.setup({
  -- Animation style
  stages = "fade_in_slide_out",
  -- Function called when a new window is opened, use for changing win settings/config
  -- on_open = nil,
  -- Function called when a window is closed
  -- on_close = nil,
  -- Render function for notifications. See notify-render()
  render = "default",
  -- Default timeout for notifications
  timeout = 3000,
  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
  background_colour = "#000000",
  -- Minimum width for notification windows
  minimum_width = 50,
  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

-- Lsp update showed by notify
local window = require("plugin-config.nvim-notify-external")
window.update()
