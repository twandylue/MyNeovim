local status, nvimtree = pcall(require, 'nvim-tree')
if (not status) then
  print("nvim-tree is not installed")
  return
end

nvimtree.setup {
  git = {
    enable = true
  },
  -- open current directory
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
}
