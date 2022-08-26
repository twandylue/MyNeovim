local status, term = pcall(require, 'toggleterm');
if (not status) then
  print("toggleterm is not installed")
  return
end

term.setup {

}

