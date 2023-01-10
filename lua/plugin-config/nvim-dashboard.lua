local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("Dashboard is not installed", vim.log.levels.ERROR)
  print("Dashboard is not installed.")
  return
end

db.custom_footer = {
  "Andy Lu", "🎉 In neovim we trust 🎉"
}

db.preview_file_height = 11
db.preview_file_width = 70
db.header_pad = 3
db.center_pad = 3
db.footer_pad = 2

db.custom_center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    shortcut = "Ctrl p ",
    action = "Telescope project",
  },
  {
    icon = "ﮧ  ",
    desc = "Terminal                            ",
    shortcut = ":term  ",
    action = ":terminal",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    shortcut = "      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Find file                           ",
    shortcut = "SPC .  ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
  },
  {
    icon = "  ",
    desc = "Find text                           ",
    shortcut = "      ",
    action = "Telescope live_grep",
  },
  {
    icon = "  ",
    desc = "Fugitive                            ",
    shortcut = ":Git   ",
    action = ":Git",
  },
  {
    icon = "  ",
    desc = "New File                            ",
    shortcut = ":enew  ",
    action = "enew",
  },
}

db.custom_header = {
  [[]],
  [[]],
  [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
  [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
  [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
  [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
  [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
  [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
}
