local function getWords()
  if vim.fn.wordcount().visual_words == 1 then
    return tostring(vim.fn.wordcount().visual_words) .. " word"
  elseif not (vim.fn.wordcount().visual_words == nil) then
    return tostring(vim.fn.wordcount().visual_words) .. " words"
  else
    return tostring(vim.fn.wordcount().words) .. " words"
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'horizon',
    -- theme = 'ayu_dark',
    -- theme = 'gruvbox_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 140,
      tabline = 140,
      winbar = 140,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    -- lualine_x = {'encoding', 'fileformat', 'filetype', getWords},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}, 
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
