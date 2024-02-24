local status_dap, dap = pcall(require, "dap")
local status_dapui, dapui = pcall(require, "dapui")

if not status_dap then
  print("nvim-dap is not installed")
  return
end

if not status_dapui then
  print("nvim-dap-ui is not installed")
  return
end

dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
