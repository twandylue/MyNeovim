require 'nvim-tree'.setup {
  -- 不显示 git 状态图标
  git = {
    enable = false
  },
  -- open current directory
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
}
