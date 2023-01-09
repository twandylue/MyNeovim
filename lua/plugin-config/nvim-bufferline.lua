local status, bufferline = pcall(require, "bufferline")
if not status then
  print("bufferline is not installed")
  return
end

bufferline.setup({
  options = {
    mode                    = "tabs",
    numbers                 = "ordinal",
    -- close_command           = "bdelete! %d",
    separator_style         = "thick",
    -- separator_style         = { "", "" },
    indicator               = {
      icon = '▎',
      style = 'icon',
    },
    show_tab_indicators     = true,
    modified_icon           = '●',
    close_icon              = '',
    show_buffer_close_icons = true,
    diagnostics             = "nvim_lsp",
    show_close_icon         = true,
    color_icons             = true,
    always_show_bufferline  = true,
  },
  highlights = {
    separator = {
      fg = "#073642",
      bg = "#002b36",
    },
    separator_selected = {
      fg = "#073642",
    },
    background = {
      fg = "#657b83",
      bg = "#002b36",
    },
    buffer_selected = {
      fg = "#fdf6e3",
      -- bg = '#e62c35'
      -- undercurl = true
      underline = true,
      -- italic = true
    },
    fill = {
      bg = "#073642",
    },
  },
})
