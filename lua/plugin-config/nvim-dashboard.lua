local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("Dashboard is not installed", vim.log.levels.ERROR)
  print("Dashboard is not installed.")
  return
end

db.setup({
  theme = "doom",
  hide = {
    statusline = false,
  },
  config = {
    header = {
      [[]],
      [[]],
      [[]],
      [[]],
      [[]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[]],
      [[]],
      [[]],
    },
    center = {
      {
        icon = "  ",
        icon_hi = "Title",
        desc = "Projects                      ",
        desc_hi = "String",
        key = "Ctrl p",
        key_hi = "Number",
        action = "Telescope project",
      },
      {
        icon = "ﮧ  ",
        icon_hi = "Title",
        desc = "Terminal",
        desc_hi = "String",
        key = ":term",
        action = ":terminal",
      },
      {
        icon = "  ",
        icon_hi = "Title",
        desc = "Recently opened files",
        desc_hi = "String",
        key = "",
        action = "Telescope oldfiles",
      },
      {
        icon = "  ",
        icon_hi = "Title",
        desc = "Find File",
        desc_hi = "String",
        key = "SPC .",
        action = "Telescope find_files find_command=rg,--hidden,--files",
      },
      {
        icon = "  ",
        icon_hi = "Title",
        desc = "Find Text",
        desc_hi = "String",
        key = "[ g",
        action = "Telescope live_grep",
      },
      {
        icon = "  ",
        icon_hi = "Title",
        desc = "File Borwser",
        desc_hi = "String",
        key = "SPC E",
        action = ":Oil",
      },
      {
        icon = "  ",
        icon_hi = "Title",
        desc = "New",
        desc_hi = "String",
        key = ":enew",
        action = "enew",
      },
    },
    footer = {
      "",
      "",
      "Andy Lu",
      "🎉 In neovim we trust 🎉",
    },
  },
})
