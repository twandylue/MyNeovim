local status, _ = pcall(require, "neorg")
if not status then
  vim.notify("neorg is not installed", vim.log.levels.ERROR)
  print("neorg is not installed")
  return
end

local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  -- NOTE: Map all the below keybinds only when the "norg" mode is active
  keybinds.map_event_to_mode("norg", {
    n = {
      { "[g", "core.integrations.telescope.find_linkable" },
      { "[i", "core.integrations.telescope.insert_link" },
      { "<leader>.", "core.integrations.telescope.find_norg_files" },
    },
  }, {
    silent = true,
    noremap = true,
  })
end)
