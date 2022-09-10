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

db.custom_center = {
  -- {
  --   icon = "  ",
  --   desc = "Projects                            ",
  --   action = "Telescope projects",
  -- },
  {
    icon = "  ",
    desc = "Recently files                      ",
    -- shortcut = 'SPC s l',
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Find file                           ",
    action = "Telescope find_files",
  },
  {
    icon = "  ",
    desc = "Find text                           ",
    action = "Telescope live_grep",
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
  [[          |__/                            ]],
}
