local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then
  print("nvim-tree is not installed")
  return
end

nvimtree.setup {
  git = {
    enable = true
  },
  filters = { custom = { "^.git$" } },
  -- open current directory
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        -- { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  }
}
