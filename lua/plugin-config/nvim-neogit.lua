local status, neogit = pcall(require, 'neogit')
if (not status) then
  print("neogit is not installed")
  return
end

neogit.setup {
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
      ["b"] = "",
      -- Removes the default mapping of "s"
      -- ["s"] = "",
      -- ["<enter>"] = "Toggle",
      ["o"] = "GoToFile",
    }
  }
}
