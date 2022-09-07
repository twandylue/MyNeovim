local status, bufferline = pcall(require, 'bufferline')
if (not status) then
  print("bufferline is not installed")
  return
end

bufferline.setup {
  options = {
    -- mode = 'tabs',
    separator_style = 'thin',
    always_show_bufferline = false,
    show_buffer_close_icons = true,
    show_close_icon = true,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36'
    },
    separator_selected = {
      fg = '#073642'
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      undercurl = true
      -- underline = true,
      -- italic = true
    },
    fill = {
      bg = '#073642'
    }
  }
}
