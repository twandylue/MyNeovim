# My Neovim CheatSheet

## Commands

- Delete buffers

  ```console
  :bdelete
  :bd
  :bd!
  ```

- [Set the window size of quickfix window](https://stackoverflow.com/questions/42217825/vim-how-to-set-the-window-size-of-quickfix-window)

  ```console
  :copen [size]
  :copen 40
  ```

- QuickFix

  ```console
  :make " Compile

  :copen " Open the quickfix window
  :cclose " Close the quickfix window

  :cnext " Move to the next compile error
  :cprev " Move to the previous compile error
  ```

- [The working directory](https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file)

  ```console
  :pwd " Present working directory
  :cd [path] " cd to specific file path
  :cd %:p:h " Change to the directory of the currently open file
  :lcd %:p:h " Change the directory only for the current window
  ```
