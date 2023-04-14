local status, tokyonight = pcall(require, "tokyonight")
if not status then
  vim.notify("Color chemem: tokyonight is not installed")
  print("Color chemem: tokyonight is not installed")
  return
end

tokyonight.setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  on_colors = function(colors)
    colors.gitSigns = {
      add = "#36e080",
      change = "#057ffa",
      delete = "#d41923",
    }
    colors.error = "#ff0000"
  end,
  on_highlights = function(highlights)
    highlights.LineNr = { fg = "#dead3c" } -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    highlights.CursorLineNr = { fg = "#ff0000", bold = true } -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    highlights.ModeMsg = { fg = "#73c936", bold = true } -- 'showmode' message (e.g., "-- INSERT -- ")
  end,
})
