local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("Dashboard is not installed")
  return
end

db.custom_footer = {
  "Andy Lu",
}

db.preview_file_height = 11
db.preview_file_width = 70
db.header_pad = 3
db.center_pad = 3
db.footer_pad = 2

db.custom_center = {
  -- {
  --   icon = "  ",
  --   desc = "Projects                            ",
  --   action = "Telescope projects",
  -- },
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
    action = 'Telescope find_files find_command=rg,--hidden,--files',
  },
  {
    icon = "  ",
    desc = "Find text                           ",
    shortcut = "      ",
    action = "Telescope live_grep",
  },
  {
    icon = "  ",
    desc = "Porject                             ",
    shortcut = "Ctrl p",
    action = "Telescope project",
  },
  {
    icon = "  ",
    desc = "Neogit                              ",
    shortcut = "SPC g g",
    action = ":Neogit",
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
  -- {
  --   icon = "  ",
  --   desc = "Edit keybindings                    ",
  --   action = "edit ~/.config/nvim/lua/keybindings.lua",
  -- },
}

db.custom_header = {
  [[    __  __      _  _             _        ]],
  [[   |  \/  |_  _| \| |___ _____ _(_)_ __   ]],
  [[   | |\/| | || | .` / -_) _ \ V / | '  \  ]],
  [[   |_|  |_|\_, |_|\_\___\___/\_/|_|_|_|_| ]],
  [[           |__/                           ]],
}
