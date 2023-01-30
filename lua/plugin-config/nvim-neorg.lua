local status, neorg = pcall(require, "neorg")
if not status then
  vim.notify("neorg is not installed", vim.log.levels.ERROR)
  print("neorg is not installed")
  return
end

neorg.setup({
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode",
      },
    },
    ["core.export"] = {
      config = {},
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/Desktop/My-Neorg/work",
          life = "~/Desktop/My-Neorg/life",
          my_ws = "~/Desktop/MyWorkNotes/neorg", -- Format: <name_of_workspace> = <path_to_workspace_root>
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg", -- The name of the main (root) .norg file
      },
    },
  },
})
