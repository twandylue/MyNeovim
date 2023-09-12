local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("Dashboard is not installed", vim.log.levels.ERROR)
  print("Dashboard is not installed.")
  return
end

db.setup({
  theme = "doom",
  hide = {
    statusline = true,
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
    },
    center = {
      {
        icon = "  ",
        icon_hl = "Title",
        desc = "Projects                      ",
        desc_hl = "String",
        key = "Ctrl p",
        key_hl = "Number",
        action = "Telescope project",
      },
      {
        icon = "  ",
        icon_hl = "Title",
        desc = "File Explorer",
        desc_hl = "String",
        key = "SPC e",
        key_hl = "Number",
        action = ":Oil",
      },
      {
        icon = "  ",
        icon_hl = "Title",
        desc = "Recently opened files",
        desc_hl = "String",
        key = "",
        key_hl = "Number",
        action = "Telescope oldfiles",
      },
      {
        icon = "  ",
        icon_hl = "Title",
        desc = "Find File",
        desc_hl = "String",
        key = "SPC .",
        key_hl = "Number",
        action = "Telescope find_files find_command=rg,--hidden,--files",
      },
      {
        icon = "  ",
        icon_hl = "Title",
        desc = "Find Text",
        desc_hl = "String",
        key = "[ g",
        key_hl = "Number",
        action = "Telescope live_grep",
      },
      {
        icon = "  ",
        icon_hl = "Title",
        desc = "New",
        desc_hl = "String",
        key = ":enew",
        key_hl = "Number",
        action = "enew",
      },
    },
    footer = {
      "",
      "",
      "雖知前途坎坷 我亦吾往矣",
      "",
      "Andy Lu",
      "🎉 In neovim we trust 🎉",
    },
  },
})
