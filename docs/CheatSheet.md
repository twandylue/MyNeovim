# My Neovim CheatSheet

## Commands

### Delete buffers

```plain
:bdelete
:bd
:bd!
```

### [Set the window size of quickfix window](https://stackoverflow.com/questions/42217825/vim-how-to-set-the-window-size-of-quickfix-window)

```plain
:cw [size]
:copen [size]
:copen 40
```

### QuickFix

```plain
:make   " Compile

:copen  " Open the quickfix window whatever
:cw     " Open the qf if there are errors
:cclose " Close the quickfix window

:cnext  " Move to the next compile error
:cprev  " Move to the previous compile error
```

[Focus on quickfix window](https://www.reddit.com/r/vim/comments/hfovi6/how_can_i_keep_my_cursor_intact_in_quickfix_list/)

### Grep in Vim

In Linux or Unix

```plain
:grep <word> <file>

:grep test ./src/main.rs
:grep test ** " grep from all file under the current directory(pwd)
```

In Windows

```plain
:vimgrep <word> <file>

:vimgrep test ./src/main.rs
:vimgrep test ** " grep from all file under the current directory(pwd)
```

[Learn more](https://zhuanlan.zhihu.com/p/148280898)

### [The working directory](https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file)

```plain
:pwd       " Present working directory
:cd [path] " cd to specific file path
:cd %:p:h  " Change to the directory of the currently open file
:lcd %:p:h " Change the directory only for the current window
```

### [Read command output from `stdin`](https://askubuntu.com/questions/510890/how-do-i-redirect-command-output-to-vim-in-bash)

```plain
[command] | nvim -
ls -a | nvim -
ls -a | vim -
```

### [Command in Vim](http://www.study-area.org/tips/vim/Vim-8.html#shell)

```plain
:![external command]   " execute external command. *Beware of your path. 
:r ![external command] " execute external command and `insert` the output to your buffer(cursor location).
```

### Format JSON file with jq in Vim

```plain
:'<,'>!jq . " format selected section with jq
:%!jq . " format all file with jq
```

## Keys Map

### Jumping

```plain
.`:        " Jump to last change.
ctrl + o:  " Jump backward to cursor location.
ctrl + i:  " Jump forward to cursor location.
```

## Plugins

### [rest.nvim](https://github.com/rest-nvim/rest.nvim)

```http
GET https://reqres.in/api/users?page=5
Cookie: session_token="test"
# or/
Authentication: Bearer <token>
  ```

In `*.http`

- [reference](https://github.com/rest-nvim/rest.nvim/issues/98)
