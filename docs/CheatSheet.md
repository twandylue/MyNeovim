# My Neovim CheatSheet

## Commands

### Delete buffers

```plain
:bdelete
:bd
:bd!
```

### Show trail

```plain
:set list  " show
:set list! " hide
```

[Learn more](https://vi.stackexchange.com/questions/31811/neovim-lua-config-how-to-append-to-listchars)

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
:grep test -r * " recursively grep from all file under the current directory(pwd)
```

In Windows

```plain
:vimgrep <word> <file>

:vimgrep test ./src/main.rs
:vimgrep test ** " recursively grep from all file under the current directory(pwd)
```

[Learn more](https://zhuanlan.zhihu.com/p/148280898)

#### Use ripgrep instead of native grep

In .vimrc

```vimrc
" use rg instead of native grep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif
```

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [Learn more](https://phelipetls.github.io/posts/extending-vim-with-ripgrep/)

### [The working directory](https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file)

```plain
:pwd       " Present working directory
:cd [path] " cd to specific file path
:cd %:h    " Change to the directory of the currently open file -1
:cd %:p:h  " Change to the directory of the currently open file -2
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
:'<,'>!jq " format selected section with jq
:%!jq " format all file with jq
```

or

```plain
:'<,'>!jq . " format selected section with jq
:%!jq . " format all file with jq
```

### Remove Lines Matching a Pattern

```plain
:g/pattern/d  " Remove lines matching pattern
:g!/pattern/d " Remove lines that do NOT match the pattern
:v/pattern/d  " Also removes lines that do not match the pattern
```

[Learn more](https://vimtricks.com/p/remove-lines-matching-a-pattern-in-vim/)

### Exit insert mode with :normal command

To add a literal \<ESC\> to your command, while in insert mode, press CTRL-V then \<ESC\>

[Learn more](https://stackoverflow.com/questions/4010890/vim-exit-insert-mode-with-normal-command)

### Substitute in visual selection

```plain
:s/\%V[word1]/[word_after]/g
```

[Learn more](https://vim.fandom.com/wiki/Search_and_replace_in_a_visual_selection)

### Substitute words in QuickFix

```plain
:cdo s/foo/bar/g | update
```

[Learn more](https://chrisarcand.com/vims-new-cdo-command/)

## Key Map

### [Splitting](https://stackoverflow.com/a/7982215)

```console
ctrl-w_H/J/K/L  " move the current window to the far left, bottom, top or right side
```

### Jumping

```plain
ctrl_o   " Jump backward to cursor location.
ctrl_i   " Jump forward to cursor location.
g;       " Jump to the older change.
g.       " Jump to the newer change.
```

### Get the Current File Name

In `insert mode`

```plain
ctrl_r %
```

## Plugins

### [rest.nvim](https://github.com/rest-nvim/rest.nvim)

In `*.http`

```plain
GET https://reqres.in/api/users?page=5
Cookie: session_token="test"
```

or

```plain
GET https://reqres.in/api/users?page=5
Authentication: Bearer <token>
```

- [reference](https://github.com/rest-nvim/rest.nvim/issues/98)
